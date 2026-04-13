# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python client for Apple WeatherKit API"
HOMEPAGE="https://github.com/tjhorner/python-weatherkit https://pypi.org/project/apple_weatherkit/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-retry-2.8.3[${PYTHON_USEDEP}]
	<dev-python/aiohttp-retry-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.0.0[crypto,${PYTHON_USEDEP}]
	<dev-python/pyjwt-3.0.0[crypto,${PYTHON_USEDEP}]"

distutils_enable_tests pytest