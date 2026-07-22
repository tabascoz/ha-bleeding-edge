# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="An async GeoJSON client library"
HOMEPAGE="https://github.com/exxamalte/python-aio-geojson-client https://pypi.org/project/aio-geojson-client/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
    <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
    >=dev-python/geojson-3.3.0[${PYTHON_USEDEP}]
    >=dev-python/haversine-2.9.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/pytest-timeout[${PYTHON_USEDEP}]
        dev-python/pytest-xdist[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/coverage[${PYTHON_USEDEP}]
        dev-python/mock[${PYTHON_USEDEP}]
        dev-python/aiointercept[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest