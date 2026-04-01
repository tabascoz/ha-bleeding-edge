# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="OHF Matter Server - WebSocket Matter controller based on matter.js"
HOMEPAGE="https://github.com/matter-js/matterjs-server"

SRC_URI="
    https://registry.npmjs.org/matter-server/-/matter-server-${PV}.tgz -> ${P}.tgz
    https://raw.githubusercontent.com/tabascoz/ha-bleeding-edge/refs/heads/main/net-misc/matterjs-server/files/matter-server-${PV}-vendor.tar.xz -> ${P}-vendor.tar.xz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="+server +systemd"
REQUIRED_USE="systemd? ( server )"

RDEPEND="
    server? ( >=net-libs/nodejs-22.13.0:* acct-group/matter-server acct-user/matter-server )
"

S="${WORKDIR}/matter-server-${PV}"

inherit systemd

src_unpack() {
    unpack ${A}

    mv "${WORKDIR}/package" "${S}" || die "Failed to move main package dir"

    if use server; then
        mkdir -p "${S}/node_modules" || die
        tar -xf "${DISTDIR}/${P}-vendor.tar.xz" -C "${S}/node_modules" --strip-components=1 || die "Vendor unpack failed (check tar structure)"
        einfo "Vendored node_modules unpacked into ${S}/node_modules"
    fi
}

src_install() {
    if ! use server; then
        return 0
    fi

    insinto /opt/${PN}

    doins -r dist node_modules package.json  # core runtime files

    [[ -d public ]]     && doins -r public
    [[ -d config ]]     && doins -r config
    [[ -f README.md ]]  && dodoc README.md
    [[ -f CHANGELOG.md ]] && dodoc CHANGELOG.md

    cat > "${T}/matter-server" <<-'EOF'
#!/bin/sh
exec /usr/bin/node --enable-source-maps "/opt/matterjs-server/dist/esm/MatterServer.js" "$@"
EOF
    newbin "${T}/matter-server" matter-server

    if use systemd; then
        systemd_dounit "${FILESDIR}/${PN}.service"
    fi
}

pkg_postinst() {
    if use server; then
        elog "Manual start: matter-server --storage-path /var/lib/matterjs-server"
        elog "Dashboard: http://localhost:5580"
        elog ""
        elog "Recommended: mkdir -p /var/lib/matterjs-server && chown -R matter:matter /var/lib/matterjs-server"
    fi

    if use systemd; then
        elog "Systemd: systemctl enable --now matterjs-server.service"
    fi
}