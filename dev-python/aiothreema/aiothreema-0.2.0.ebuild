# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Async Python client for the Threema Gateway HTTP API"
HOMEPAGE="https://pypi.org/project/aiothreema/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/pynacl-1.5.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.0.0[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest