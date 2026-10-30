# Copyright 2021-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Local variant of net-libs/libtorrent-rasterbar-2.1.2, needed by deluge-2.2.0-r4 in
# this overlay.  The only difference from upstream is the ABI define carried by
# files/libtorrent-rasterbar-2.1.2-abi-v1.patch, which builds the library and its python
# bindings with TORRENT_ABI_VERSION=1: libtorrent 2.1 defaults to ABI 2 and leaves the
# 1.x-era members out of the bindings, which is why deluge with 2.1.2 lost
#   add_torrent_params['resume_data']  -> 'unknown name in torrent params: resume_data'
#   torrent_status.paused/auto_managed -> "AttributeError ... has no attribute 'paused'"
#   enc_level.plaintext/rc4/both       -> the same in preferencesmanager.py
# The first one made the daemon add no torrent at all (empty library); the others spam
# syslog.  Nothing in deluge needs patching for that: ABI 1 also keeps the newer names
# the bindings gate at 'TORRENT_ABI_VERSION < 4' (torrent_handle.torrent_file(),
# get_renamed_files()), so the deluge#532 patch folded into deluge-2.2.0-r4 still works.
# Upstream Gentoo avoids this by pinning deluge to <net-libs/libtorrent-rasterbar-2.1,
# which is not needed with this efile.  Upstream's own test patch is duplicated under
# files/ because ${FILESDIR} here is the local overlay's.

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
# only simulation/libsimulator (never built) has an old cmake_minimum_required
CMAKE_QA_COMPAT_SKIP=1

inherit cmake python-single-r1

DESCRIPTION="C++ BitTorrent implementation focusing on efficiency and scalability"
HOMEPAGE="https://libtorrent.org/ https://github.com/arvidn/libtorrent"
SRC_URI="https://github.com/arvidn/libtorrent/releases/download/v${PV}/${P}.tar.gz"

LICENSE="BSD"
SLOT="0/$(ver_cut 1-2)"
KEYWORDS="~amd64 ~arm ~arm64 ~loong ~ppc ~ppc64 ~riscv ~sparc ~x86"
IUSE="+dht debug examples gnutls python ssl test"
REQUIRED_USE="python? ( ${PYTHON_REQUIRED_USE} )"
RESTRICT="!test? ( test )"

DEPEND="
	dev-libs/boost:=
	ssl? (
		gnutls? ( net-libs/gnutls:= )
		!gnutls? ( dev-libs/openssl:= )
	)
"
RDEPEND="
	${DEPEND}
	python? (
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-libs/boost[python,${PYTHON_USEDEP}]
		')
	)
"
BDEPEND="
	dev-util/patchelf
	python? (
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-python/setuptools[${PYTHON_USEDEP}]
		')
	)
	test? (
		${PYTHON_DEPS}
	)
"

PATCHES=(
	"${FILESDIR}"/${P}-test-no-logging.patch
	"${FILESDIR}"/${P}-abi-v1.patch
)

pkg_setup() {
	# python required for tests due to webserver.py
	if use python || use test; then
		python-single-r1_pkg_setup
	fi
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_CXX_STANDARD=17
		-DBUILD_SHARED_LIBS=ON
		-Dbuild_examples=$(usex examples)
		-Ddht=$(usex dht)
		-Dencryption=$(usex ssl)
		-Dgnutls=$(usex gnutls)
		-Dlogging=$(usex debug)
		-Dpython-bindings=$(usex python)
		-Dbuild_tests=$(usex test)
		# bundles libdatachannel, libjuice, usrsctp, libsrtp and plog
		-Dwebtorrent=OFF
	)

	# We need to drop the . from the Python version to satisfy Boost's
	# FindBoost.cmake module, bug #793038.
	use python && mycmakeargs+=( -Dboost-python-module-name="${EPYTHON/./}" )

	cmake_src_configure
}

src_test() {
	CMAKE_SKIP_TESTS=(
		# Needs running UPnP server
		"test_upnp"
		# Fragile to parallelization
		# https://bugs.gentoo.org/854603#c1
		"test_utp"
		# Flaky test, fails randomly
		"test_remove_torrent"
	)

	LD_LIBRARY_PATH="${BUILD_DIR}:${LD_LIBRARY_PATH}" cmake_src_test
}

src_install() {
	cmake_src_install
	einstalldocs

	if use examples; then
		pushd "${BUILD_DIR}"/examples >/dev/null || die
		for binary in {client_test,connection_tester,custom_storage,dump_bdecode,dump_torrent,make_torrent,simple_client,stats_counters,upnp_test}; do
			patchelf --remove-rpath ${binary} || die
			dobin ${binary}
		done
		popd >/dev/null || die
	fi
}
