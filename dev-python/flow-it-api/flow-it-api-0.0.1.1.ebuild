# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Python API library client for the FlowIt VMC machine"
HOMEPAGE="https://pypi.org/project/flow-it-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/httpx-0.27.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-12.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/hatchling-0.1[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-8.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-httpx-0.30.0[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest