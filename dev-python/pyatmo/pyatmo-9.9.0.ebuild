# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

PYPI_PN="pyatmo"

DESCRIPTION="Simple API to access Netatmo weather station data from any Python 3 script. Designed for Home Assistant (but not only)"
HOMEPAGE="https://github.com/jabesq/pyatmo https://pypi.org/project/pyatmo/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.7.4[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	~dev-python/oauthlib-3.3.1[${PYTHON_USEDEP}]
	>=dev-python/requests-2.24[${PYTHON_USEDEP}]
	<dev-python/requests-3.0[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-1.3[${PYTHON_USEDEP}]
	<dev-python/requests-oauthlib-3.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.1[${PYTHON_USEDEP}]
	<dev-python/tenacity-10[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest