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
    dev-python/aiofiles[${PYTHON_USEDEP}]
    >=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
    <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
    dev-python/colorlog[${PYTHON_USEDEP}]
    dev-python/defusedxml[${PYTHON_USEDEP}]
    dev-python/deprecated[${PYTHON_USEDEP}]
    dev-python/ifaddr[${PYTHON_USEDEP}]
    dev-python/pycryptodome[${PYTHON_USEDEP}]
    dev-python/platformdirs[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest