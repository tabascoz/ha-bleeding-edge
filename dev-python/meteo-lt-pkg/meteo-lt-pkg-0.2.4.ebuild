# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A library to fetch weather data from api.meteo.lt"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test dev"
RESTRICT="!test? ( test )"

RDEPEND="
    dev-python/aiohttp[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
    )
    dev? (
        dev-python/black[${PYTHON_USEDEP}]
        dev-python/coverage[${PYTHON_USEDEP}]
        dev-python/flake8[${PYTHON_USEDEP}]
        dev-python/pyflakes[${PYTHON_USEDEP}]
        dev-python/pylint[${PYTHON_USEDEP}]
        dev-python/build[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest