# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A Python API Client for the RainbowMiner multipool cryptominer."
HOMEPAGE="https://pypi.org/project/rainbowminer-api-client/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiohttp-3.14.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.13.4[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.17.0[${PYTHON_USEDEP}]
	<dev-python/yarl-2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest