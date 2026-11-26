# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Async Python library for Mitsubishi minisplit control via Kumo Cloud and local API"
HOMEPAGE="https://pypi.org/project/mitsubishi-comfort/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

# relaxed by tools/relaxbounds.py: an operator in the block below named a version
# no repo carries. The bound is answered with the newest version that IS available -
# never a downgrade, never a version nobody declared (WORKFLOW.md step 12's rule).
RDEPEND="
	>=dev-python/aiohttp-3.14.5[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-8.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23[${PYTHON_USEDEP}]
		>=dev-python/aioresponses-0.7.8[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest