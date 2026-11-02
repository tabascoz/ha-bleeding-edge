# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Asynchronous Python library for the Škoda public API"
HOMEPAGE="https://pypi.org/project/skoda-public-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.5.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-9.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23.0[${PYTHON_USEDEP}]
		>=dev-python/aresponses-3.0.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest