# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Async Python client for Xthings Cloud API"
HOMEPAGE="https://pypi.org/project/ha-xthings-cloud/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest