# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python API client for Green Planet Energy electricity pricing data"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/black[${PYTHON_USEDEP}]
        dev-python/ruff[${PYTHON_USEDEP}]
        dev-python/mypy[${PYTHON_USEDEP}]
        dev-python/aioresponses[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest