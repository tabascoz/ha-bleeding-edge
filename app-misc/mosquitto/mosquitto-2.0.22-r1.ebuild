# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# This revision is the upstream app-misc/mosquitto-2.0.22 ebuild plus one
# source fix, written out where it is applied, plus the release name pinned
# in SRC_URI and S: this -r1 is our own revision of that same release, so
# ${P} would ask mosquitto.org for a tarball it never published.  Drop this
# file when upstream grows the same fix, and take that revision instead.

EAPI=8
PYTHON_COMPAT=( python3_{11..14} )

inherit eapi9-ver python-any-r1 systemd toolchain-funcs

DESCRIPTION="An Open Source MQTT v3 Broker"
HOMEPAGE="https://mosquitto.org/ https://github.com/eclipse/mosquitto"
UPSTREAM_RELEASE="2.0.22"
SRC_URI="https://mosquitto.org/files/source/mosquitto-${UPSTREAM_RELEASE}.tar.gz"
# ${P} would name our revision, mosquitto-2.0.22-r1, and that name is on
# neither side of the fetch: mosquitto.org publishes
# mosquitto-2.0.22.tar.gz, whose archive unpacks a 'mosquitto-2.0.22'
# directory. The default S is ${WORKDIR}/${P}, so it would look for a
# directory no release ever shipped; S also has to be an absolute path,
# which is why it is anchored on ${WORKDIR} here rather than left bare.
S="${WORKDIR}/mosquitto-${UPSTREAM_RELEASE}"

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="amd64 arm ~arm64 ~sparc x86"
IUSE="+bridge examples +persistence +srv ssl systemd tcpd test websockets"
RESTRICT="!test? ( test )"

REQUIRED_USE="test? ( bridge )"

RDEPEND="
	acct-user/mosquitto
	acct-group/mosquitto
	dev-libs/cJSON
	srv? ( net-dns/c-ares:= )
	ssl? (
		dev-libs/openssl:0=
	)
	systemd? ( sys-apps/systemd:= )
	tcpd? ( sys-apps/tcp-wrappers )
	websockets? ( net-libs/libwebsockets[lejp] )
"
DEPEND="
	${RDEPEND}
	test? ( dev-util/cunit )
"
BDEPEND="
	test? (
		${PYTHON_DEPS}
		$(python_gen_any_dep 'dev-python/psutil[${PYTHON_USEDEP}]')
	)
"

python_check_deps() {
	python_has_version -b "dev-python/psutil[${PYTHON_USEDEP}]"
}

pkg_setup() {
	use test && python_setup
}

_emake() {
	local LIBDIR=$(get_libdir)
	emake \
		CC="$(tc-getCC)" \
		CXX="$(tc-getCXX)" \
		CLIENT_LDFLAGS="${LDFLAGS}" \
		LIB_SUFFIX="${LIBDIR:3}" \
		WITH_BRIDGE="$(usex bridge)" \
		WITH_PERSISTENCE="$(usex persistence)" \
		WITH_SRV="$(usex srv)" \
		WITH_SYSTEMD="$(usex systemd)" \
		WITH_TLS="$(usex ssl)" \
		WITH_WEBSOCKETS="$(usex websockets)" \
		WITH_WRAP="$(usex tcpd)" \
		"$@"
}

src_prepare() {
	default

	# Why this revision exists: upstream reads the length field of an
	# ASN1_OCTET_STRING while measuring the IP entries of a subjectAltName
	# record in lib/tls_mosq.c.  OpenSSL 4.x no longer defines struct
	# asn1_string_st in its public headers (openssl/types.h only typedefs it,
	# openssl/asn1.h forward declares the struct), so that field read is an
	# invalid use of an incomplete type, and the build stops right there:
	#
	#   tls_mosq.c:171:53: error: invalid use of incomplete typedef
	#       ASN1_OCTET_STRING {aka struct asn1_string_st}
	#   tls_mosq.c:176:59: error: invalid use of incomplete typedef
	#       ASN1_OCTET_STRING {aka struct asn1_string_st}
	#
	# ASN1_STRING_length() names the same value through the public accessor,
	# which has been public since openssl 1.1.0, the API level this build
	# already asks for with -DOPENSSL_API_COMPAT=0x10100000L and the one the
	# version guards around these two lines lean on.  Nothing else in the
	# tree reads ASN.1 internals, so this is all the compile needs.

	patch -p1 <<'EOF'
--- a/lib/tls_mosq.c
+++ b/lib/tls_mosq.c
@@ -168,12 +168,12 @@
 #else
 				data = ASN1_STRING_get0_data(nval->d.iPAddress);
 #endif
-				if(nval->d.iPAddress->length == 4 && ipv4_ok){
+				if(ASN1_STRING_length(nval->d.iPAddress) == 4 && ipv4_ok){
 					if(!memcmp(ipv4_addr, data, 4)){
 						sk_GENERAL_NAME_pop_free(san, GENERAL_NAME_free);
 						return 1;
 					}
-				}else if(nval->d.iPAddress->length == 16 && ipv6_ok){
+				}else if(ASN1_STRING_length(nval->d.iPAddress) == 16 && ipv6_ok){
 					if(!memcmp(ipv6_addr, data, 16)){
 						sk_GENERAL_NAME_pop_free(san, GENERAL_NAME_free);
 						return 1;
EOF

	# A patch that quietly stopped matching would hand the compiler the same
	# cryptic failure much later, so stop here where the reason is known.
	grep -q "ASN1_STRING_length(nval->d.iPAddress) == 4" lib/tls_mosq.c \
		|| die "the subjectAltName IP length fix did not apply"

	if use persistence; then
		sed -i -e "/^#autosave_interval/s|^#||" \
			-e "s|^#persistence false$|persistence true|" \
			-e "/^#persistence_file/s|^#||" \
			-e "s|#persistence_location|persistence_location /var/lib/mosquitto/|" \
			mosquitto.conf || die
	fi

	# Remove failing tests
	sed -i \
		-e '/06-bridge-reconnect-local-out.py/d' \
		test/broker/Makefile || die
	sed -i \
		-e '/02-subscribe-qos1-async2.test/d' \
		test/lib/Makefile || die

	# Extend test timeout to prevent spurious failures
	sed -i -e 's/SUB_TIMEOUT=1/SUB_TIMEOUT=3/' \
		test/client/test.sh || die

	use test && python_fix_shebang test
}

src_compile() {
	_emake
}

src_test() {
	_emake test
}

src_install() {
	_emake DESTDIR="${D}" prefix=/usr install
	keepdir /var/lib/mosquitto
	fowners mosquitto:mosquitto /var/lib/mosquitto
	dodoc README.md CONTRIBUTING.md ChangeLog.txt
	doinitd "${FILESDIR}"/mosquitto
	insinto /etc/mosquitto
	doins mosquitto.conf
	insinto /usr/share/mosquitto
	doins misc/letsencrypt/mosquitto-copy.sh
	systemd_newunit "${FILESDIR}/mosquitto.notify.service" mosquitto.service

	if use examples; then
		docompress -x "/usr/share/doc/${PF}/examples"
		dodoc -r examples
	fi
}

pkg_postinst() {
	if ver_replacing -lt 2; then
		elog
		elog "Please read the migration guide at:"
		elog "https://mosquitto.org/documentation/migrating-to-2-0/"
		elog
		elog "If you use Lets Encrypt TLS certificates, take note of"
		elog "the changes required to run the daemon as the unprivileged"
		elog "mosquitto user. The mosquitto-copy.sh script has been"
		elog "installed to /usr/share/mosquitto/ for your convenience."
		elog
	fi
}
