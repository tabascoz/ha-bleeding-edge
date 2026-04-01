# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="OHF Matter Server - WebSocket Matter controller based on matter.js"
HOMEPAGE="https://github.com/matter-js/matterjs-server"

SRC_URI="
    https://registry.npmjs.org/matter-server/-/matter-server-${PV}.tgz -> ${P}.tgz
    ${FILESDIR}/${P}-vendor.tar.xz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="+server +systemd"
REQUIRED_USE="systemd? ( server )"

RDEPEND="
    server? ( >=net-libs/nodejs-22.13.0:* acct-group/matter-server acct-user/matter-server )
"

BDEPEND="${RDEPEND}"

S="${WORKDIR}/package"

inherit systemd

QA_TEXTRELS="opt/matterjs-server/node_modules/*/prebuilds/*/*.node"
QA_PRESTRIPPED="opt/matterjs-server/node_modules/*/*.node opt/matterjs-server/node_modules/*/*/*.node"
QA_SONAME="opt/matterjs-server/node_modules/*/*.node opt/matterjs-server/node_modules/*/*/*.node"

src_prepare() {
    default

    if use server; then
        einfo "Unpacking base vendor node_modules..."
        mkdir -p "${S}/node_modules" || die
        tar -xf "${DISTDIR}/${P}-vendor.tar.xz" -C "${S}/node_modules" --strip-components=1 \
            || die "Failed to unpack vendor tarball"
    fi
}

src_compile() {
    if ! use server; then
        return 0
    fi

    cd "${S}" || die

    einfo "Running npm install to fix scoped packages and symlinks..."
    npm install --production --omit=dev --ignore-scripts --no-audit --no-fund --no-bin-links || die "npm install failed"

    einfo "matter-server build completed"
}

src_install() {
    if ! use server; then
        return 0
    fi

    insinto /opt/${PN}

    doins -r dist node_modules package.json
    [[ -d public ]] && doins -r public

    [[ -f README.md ]] && dodoc README.md

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
        elog "Manual start:"
        elog "  matter-server --storage-path /var/lib/matterjs-server"
        elog "Dashboard: http://localhost:5580"
        elog ""
        elog "Recommended:"
        elog "  mkdir -p /var/lib/matterjs-server"
        elog "  chown -R matter-server:matter-server /var/lib/matterjs-server"
    fi

    if use systemd; then
        elog "Systemd service:"
        elog "  systemctl enable --now matterjs-server.service"
    fi
}