# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Python Client for the OHF Matter Server"
HOMEPAGE="https://github.com/matter-js/matterjs-server/tree/main/python_client"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="test"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	=dev-python/home-assistant-chip-clusters-2025.7.0[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest