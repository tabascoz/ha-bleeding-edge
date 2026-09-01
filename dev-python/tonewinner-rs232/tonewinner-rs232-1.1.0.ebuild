# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=uv-build
inherit pypi distutils-r1

DESCRIPTION="Async Python library for Tonewinner AV processors over RS232 serial"
HOMEPAGE="https://pypi.org/project/tonewinner-rs232/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/serialx-1.2.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-8.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.3[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest