# Copyright 2025
# Distributed under the terms of the Apache-2.0 license

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
# Upstream publishes sdist as "victron_ble_ha_parser-<ver>.tar.gz"
#PYPI_PN="${PN//-/_}"

inherit distutils-r1 pypi
DESCRIPTION="Parser for Victron BLE messages (Home Assistant oriented)"
HOMEPAGE="https://github.com/rajlaud/victron-ble-ha-parser https://pypi.org/project/${PN}/"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~arm"
IUSE=""

# Uses a PEP517 setuptools build; no tests shipped
RESTRICT="test"

# Runtime deps
# victron-ble provides the device parsers this package wraps
RDEPEND="
	dev-python/victron-ble[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
"

# Nothing special to adjust
# distutils-r1 + pypi will set SRC_URI and S automatically

