# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="An asyncio client for the Home Connect API."
HOMEPAGE="https://github.com/MartinHjelmare/aiohomeconnect https://pypi.org/project/aiohomeconnect/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-data-tools-1.19.0[${PYTHON_USEDEP}]
	>=dev-python/habluetooth-2.1.0[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
	>=dev-python/httpx-sse-0.4.3[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.8.1[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/requests[${PYTHON_USEDEP}]
	)"

#PATCHES=( "${FILESDIR}/${P}-remove-tests.patch" )


distutils_enable_tests pytest
