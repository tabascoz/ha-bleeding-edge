# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=maturin
inherit distutils-r1 pypi

DESCRIPTION="Deebot client library in python 3"
HOMEPAGE="https://github.com/DeebotUniverse/client.py https://pypi.org/project/deebot-client/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.13.3[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4.0[${PYTHON_USEDEP}]
	>=dev-python/aiomqtt-2.5[${PYTHON_USEDEP}]
	<dev-python/aiomqtt-3.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-5.0[${PYTHON_USEDEP}]
	<dev-python/cachetools-8.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.11.3[${PYTHON_USEDEP}]"
BDEPEND="dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	dev-python/pytest-timeout[${PYTHON_USEDEP}]
	>=dev-python/pycountry-24.6.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest