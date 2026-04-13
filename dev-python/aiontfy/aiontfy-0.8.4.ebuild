# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Async ntfy client library"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="None"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.11[${PYTHON_USEDEP}]
    <dev-python/aiohttp-3.12[${PYTHON_USEDEP}]
    >=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
    <dev-python/mashumaro-3.14[${PYTHON_USEDEP}]
    >=dev-python/orjson-3.11.7[${PYTHON_USEDEP}]
    <dev-python/orjson-4.0[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest
