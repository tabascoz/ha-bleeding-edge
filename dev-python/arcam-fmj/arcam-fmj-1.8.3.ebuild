# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A python library for speaking to Arcam receivers"
HOMEPAGE="https://github.com/elupus/arcam_fmj https://pypi.org/project/arcam-fmj/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=""

BDEPEND="
	test? (
		dev-python/coveralls[${PYTHON_USEDEP}]
		>=dev-python/pytest-aiohttp-1.0.0[${PYTHON_USEDEP}]
		~dev-python/pytest-asyncio-0.21.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-3.0.0[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		>dev-python/pytest-3.6.4[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest