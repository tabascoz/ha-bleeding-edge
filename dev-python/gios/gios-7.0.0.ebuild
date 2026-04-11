# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for getting air quality data from GIOS servers."
HOMEPAGE="https://github.com/bieniu/gios https://pypi.org/project/gios/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.9.4[${PYTHON_USEDEP}]
	>=dev-python/dacite-1.7.0[${PYTHON_USEDEP}]
	dev-python/yarl[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		~dev-python/aioresponses-0.7.8[${PYTHON_USEDEP}]
		~dev-python/coverage-7.13.0[${PYTHON_USEDEP}]
		~dev-python/mypy-1.19.1[${PYTHON_USEDEP}]
		~dev-python/pytest-asyncio-1.3.0[${PYTHON_USEDEP}]
		~dev-python/pytest-cov-7.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-error-for-skips-2.0.2[${PYTHON_USEDEP}]
		~dev-python/pytest-timeout-2.4.0[${PYTHON_USEDEP}]
		~dev-python/pytest-9.0.2[${PYTHON_USEDEP}]
		~dev-python/ruff-0.14.10[${PYTHON_USEDEP}]
		~dev-python/syrupy-5.0.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest