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
    inherit pypi
    SRC_URI="$(pypi_sdist_url "${PN}" "${PV}")"
    KEYWORDS="~amd64 ~arm ~arm64 ~x86"
fi

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="+systemd"

RDEPEND=""

BDEPEND="
    dev-python/hatchling[${PYTHON_USEDEP}]
"

src_compile() {

#    npm install --offline --foreground-scripts --progress false || npm install --foreground-scripts --progress false
    npm install
#    npm run build --color false --offline --progress false || npm run build --color false
    npm run build --color false --progress false 
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