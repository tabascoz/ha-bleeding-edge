# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=uv-build
inherit pypi distutils-r1

DESCRIPTION="Adapter to running ASGI applications on aiohttp"
HOMEPAGE="https://pypi.org/project/aiohttp-asgi/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="rloop uvloop"

RDEPEND="
	>=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/forklib-0.5.0[${PYTHON_USEDEP}]
	<dev-python/forklib-0.6.0[${PYTHON_USEDEP}]
	rloop? (
		>=dev-python/rloop-0.5.0[${PYTHON_USEDEP}]
	)
	uvloop? (
		>=dev-python/uvloop-0.17.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"