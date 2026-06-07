# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
#PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python client for interacting with the openSenseMap API."
HOMEPAGE="https://github.com/home-assistant-ecosystem/python-opensensemap-api https://pypi.org/project/opensensemap-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		>=dev-python/pytest-9[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.21[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest