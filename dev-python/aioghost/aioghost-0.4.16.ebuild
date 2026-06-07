# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Async Python client for the Ghost Admin API"
HOMEPAGE="https://pypi.org/project/aioghost/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/aioresponses-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.21.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
		dev-util/ruff
	)
"
distutils_enable_tests pytest