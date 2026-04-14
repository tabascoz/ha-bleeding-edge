# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An asyncio client for the Home Connect API."
HOMEPAGE="https://github.com/MartinHjelmare/aiohomeconnect https://pypi.org/project/aiohomeconnect/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="cli test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/httpx-0.28.0[${PYTHON_USEDEP}]
	<dev-python/httpx-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-sse-0.4.0[${PYTHON_USEDEP}]
	<dev-python/httpx-sse-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.13.1[${PYTHON_USEDEP}]
	<dev-python/mashumaro-4.0.0[${PYTHON_USEDEP}]
	cli? (
		>=dev-python/authlib-1.3.0[${PYTHON_USEDEP}]
		<dev-python/authlib-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/fastapi-0.115.0[${PYTHON_USEDEP}]
		<dev-python/fastapi-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.34.0[${PYTHON_USEDEP}]
		<dev-python/uvicorn-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.15[${PYTHON_USEDEP}]
		<dev-python/typer-1.0.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/requests[${PYTHON_USEDEP}]
	)
"

#PATCHES=( "${FILESDIR}/${P}-remove-tests.patch" )

distutils_enable_tests pytest