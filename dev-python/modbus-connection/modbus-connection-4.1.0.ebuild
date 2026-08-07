# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

PYPI_PN="modbus-connection"

DESCRIPTION="Backend-neutral Modbus connection abstraction (pymodbus / tmodbus)"
HOMEPAGE="https://pypi.org/project/modbus-connection/ https://github.com/home-assistant-libs/modbus-connection"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
    >=dev-python/pymodbus-3.11[${PYTHON_USEDEP}]
"
BDEPEND="
    ${RDEPEND}
"