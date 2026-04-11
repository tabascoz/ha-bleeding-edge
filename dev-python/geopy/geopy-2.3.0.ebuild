# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python Geocoding Toolbox"
HOMEPAGE="https://github.com/geopy/geopy"
PYPI_PN="geopy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="aiohttp requests timezone test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/geographiclib-1.52[${PYTHON_USEDEP}]
    <dev-python/geographiclib-3[${PYTHON_USEDEP}]
    aiohttp? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
    requests? ( dev-python/requests[${PYTHON_USEDEP}] )
    timezone? ( dev-python/pytz[${PYTHON_USEDEP}] )
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/coverage[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest