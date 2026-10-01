# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 nodejs-mod systemd

DESCRIPTION="Frontend for ESPHome Device Builder"
HOMEPAGE="
    https://pypi.org/project/esphome-device-builder-frontend/
    https://github.com/esphome/device-builder-frontend
"

if [[ ${PV} == 9999 ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/esphome/device-builder-frontend.git"
    EGIT_BRANCH="main"
    S="${WORKDIR}/${P}/"
else
    SRC_URI="https://github.com/esphome/device-builder-frontend/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
    https://raw.githubusercontent.com/tabascoz/node_modules/main/dev-embedded/esphome-device-builder-frontend/${PN}-${PV}-node_modules.tar.xz
"

    KEYWORDS="~amd64 ~arm64 "
    S="${WORKDIR}/device-builder-frontend-${PV}/"
fi

LICENSE="Apache-2.0"
SLOT="0"

IUSE="+systemd"

RDEPEND=""

BDEPEND="
    dev-python/hatchling[${PYTHON_USEDEP}]
"

npm_cache_tarball="${PN}-${PV}-node_modules.tar.xz"

src_compile() {
    if [[ -d "${WORKDIR}/node_modules" ]] && [[ ! -d "${S}/node_modules" ]]; then
        ln -s "${WORKDIR}/node_modules" "${S}/node_modules" || die "Failed to symlink node_modules"
    fi

    if [[ -d "${WORKDIR}/package-lock.json" ]] && [[ ! -f "${S}/package-lock.json" ]]; then
        cp "${WORKDIR}/package-lock.json" "${S}/package-lock.json" || die "Failed to copy package-lock.json"
    fi


    npm run build --color false --progress false || die "npm build failed"
}

src_install() {
    insinto /usr/share/${PN}
    doins -r build-scripts/ 
    doins -r esphome_device_builder_frontend/
    doins -r node_modules/
    doins -r public/
    doins -r src/
    doins -r package.json
    dosym ../share/${PN} /usr/lib/node_modules/${PN}
                                                                                                                                                                                                                 
    if use systemd; then                                                                                                                                                                                           
        systemd_dounit "${FILESDIR}/${PN}.service"                                                                                                                                                                 
    fi  
}
pkg_postinst() {
    chown -R esphome:esphome /usr/share/${PN} || die
}
