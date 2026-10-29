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
IUSE="pymodbus tmodbus test"
RESTRICT="!test? ( test )"

# Both backends are PEP 508 extras this wheel declares (its METADATA's Provides-Extra), so they
# are optional groups rather than requirements of the wheel itself: modelled as flags, like the
# published mirror does. Its tmodbus line pinned 0.6.1, below the >=1.1.0 the wheel asks for,
# and its block was spelled RDEPENDS= (which portage ignores) - both are corrected here.

RDEPEND="
	dev-python/pymodbus[${PYTHON_USEDEP}]
	pymodbus? ( >=dev-python/pymodbus-3.11[${PYTHON_USEDEP}] )
	tmodbus? ( >=dev-python/tmodbus-1.1.0[${PYTHON_USEDEP}] )

"
BDEPEND="
	${RDEPEND}
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
