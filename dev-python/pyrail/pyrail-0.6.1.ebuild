# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for the iRail API"
HOMEPAGE="https://gitlab.com/tjorim/pyrail https://pypi.org/project/pyrail/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.14.4[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.23[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

PYPI_PN="pyrail"

distutils_enable_tests pytest