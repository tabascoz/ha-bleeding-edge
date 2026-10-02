# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

PYPI_PN="solaredge_modbus"

DESCRIPTION="SolarEdge Modbus data collection library for inverters over RTU/TCP"
HOMEPAGE="
    https://github.com/nmakel/solaredge_modbus
    https://pypi.org/project/solaredge-modbus/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="
    >=dev-python/pymodbus-2.3.0[${PYTHON_USEDEP}]
"