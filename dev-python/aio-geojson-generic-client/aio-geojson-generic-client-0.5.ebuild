# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An generic async GeoJSON client library."
HOMEPAGE="https://github.com/exxamalte/python-aio-geojson-generic-client https://pypi.org/project/aio-geojson-generic-client/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aio-geojson-client-0.21[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	>=dev-python/geojson-3.1.0[${PYTHON_USEDEP}]
	>=dev-python/pytz-2019.01[${PYTHON_USEDEP}]"

BDEPEND="
    dev-python/setuptools[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/pytest-timeout[${PYTHON_USEDEP}]
        dev-python/pytest-xdist[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/coverage[${PYTHON_USEDEP}]
        dev-python/mock[${PYTHON_USEDEP}]
        dev-python/aioresponses[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest