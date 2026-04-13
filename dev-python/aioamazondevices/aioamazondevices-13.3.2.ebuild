# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python library to control Amazon devices"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.12.7[${PYTHON_USEDEP}]
    dev-python/beautifulsoup4[${PYTHON_USEDEP}]
    dev-python/colorlog[${PYTHON_USEDEP}]
    dev-python/langcodes[${PYTHON_USEDEP}]
    >=dev-python/orjson-3.10[${PYTHON_USEDEP}]
    <dev-python/orjson-4[${PYTHON_USEDEP}]
    dev-python/python-dateutil[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    dev-python/poetry[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest
