# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Async Python client for the Somfy MyLink Synergy socket API"
HOMEPAGE="https://pypi.org/project/pysomfymylink/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		>=dev-python/pytest-8.3.4[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.25.3[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.0.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest