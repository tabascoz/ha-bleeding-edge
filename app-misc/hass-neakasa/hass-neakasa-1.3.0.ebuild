# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
inherit git-r3 python-single-r1 systemd

DESCRIPTION="Neakasa Integration for Home Assistant"
HOMEPAGE="https://github.com/tabascoz/hass-neakasa"

# Target the specific branch requested
EGIT_REPO_URI="https://github.com/tabascoz/hass-neakasa.git"
EGIT_COMMIT="v${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

IUSE="influxdb mqtt systemd"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# Python dependencies
# Added requests as it is a core dependency of grott
RDEPEND="
    ${PYTHON_DEPS}
    $(python_gen_cond_dep '
	dev-python/alibabacloud-apigateway-util[${PYTHON_USEDEP}]
	dev-python/alibabacloud-iot-api-gateway[${PYTHON_USEDEP}]
    ')
"
DEPEND="${RDEPEND}"

src_install() {
    # Install application files to /opt/grott
    insinto /etc/homeassistant
    doins -r *
}

