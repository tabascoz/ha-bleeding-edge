# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Python library for communicating with Specialized Turbo e-bikes over Bluetooth Low Energy"
HOMEPAGE="https://pypi.org/project/specialized-turbo/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cloud test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/bleak-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-41.0.0[${PYTHON_USEDEP}]
	cloud? (
		>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		>=dev-python/pytest-9.0.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-1.3.0[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest