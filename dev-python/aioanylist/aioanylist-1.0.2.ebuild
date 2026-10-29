# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Async-first pure-Python client for AnyList, reconstructed from the official web application"
HOMEPAGE="https://pypi.org/project/aioanylist/"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiohttp-3.10[${PYTHON_USEDEP}]
	>=dev-python/protobuf-5.27[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-8.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest