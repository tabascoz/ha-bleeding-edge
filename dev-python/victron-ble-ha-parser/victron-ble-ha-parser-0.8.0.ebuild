# Copyright 1999-2026
# Distributed under the terms of the Apache-2.0 license

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A parser for Victron BLE messages suitable for use with Home Assistant"
HOMEPAGE="https://github.com/rajlaud/victron-ble-ha-parser https://pypi.org/project/${PN}/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

# Uses a PEP517 setuptools build; no tests shipped
RESTRICT="test"

# Runtime deps
# victron-ble provides the device parsers this package wraps
RDEPEND="
	>=dev-python/bluetooth-sensor-state-data-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.16.0[${PYTHON_USEDEP}]
	=dev-python/victron-ble-0.9.3[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
"