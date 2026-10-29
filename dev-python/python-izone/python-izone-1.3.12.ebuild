# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
PYPI_PN="python-izone"
inherit distutils-r1 pypi

DESCRIPTION="A python interface to the iZone airconditioner controller"
HOMEPAGE="https://github.com/Swamp-Ig/pizone https://pypi.org/project/python-izone/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.14.3[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-6.2.2[${PYTHON_USEDEP}]
		dev-python/pytest-aio[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest