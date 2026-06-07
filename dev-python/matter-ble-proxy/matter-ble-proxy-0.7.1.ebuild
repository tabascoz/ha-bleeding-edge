# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Python client library for the OHF Matter Server BLE proxy protocol"
HOMEPAGE="https://pypi.org/project/matter-ble-proxy/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/bleak[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-9.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.24[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-1.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-7.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
