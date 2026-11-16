# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python library to control Vitesy devices"
HOMEPAGE="https://pypi.org/project/aiovitesy/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.14.0[${PYTHON_USEDEP}]
    <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
    >=dev-python/aiomqtt-2.5[${PYTHON_USEDEP}]
    <dev-python/aiomqtt-3.0[${PYTHON_USEDEP}]
    >=dev-python/orjson-3.10.0[${PYTHON_USEDEP}]
    <dev-python/orjson-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest