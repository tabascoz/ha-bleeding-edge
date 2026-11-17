# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Control your Midea M-Smart appliances via local area network"
HOMEPAGE="https://github.com/midea-lan/midea-local"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiofiles-25.1.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.14.5[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.14.2[${PYTHON_USEDEP}]
	>=dev-python/colorlog-6.10.1[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.24.1[${PYTHON_USEDEP}]
	<dev-python/pycryptodome-5[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.14.5[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.16.0[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.25.1[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest