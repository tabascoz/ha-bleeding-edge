# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python API for Unifi Protect (Unofficial)"
HOMEPAGE="https://github.com/uilibs/uiprotect https://pypi.org/project/uiprotect/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cli test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiofiles-24[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.14.3[${PYTHON_USEDEP}]
	>=dev-python/aiozoneinfo-0.2.3[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '>=dev-python/av-17.0.1[${PYTHON_USEDEP}]' python3_11)
	$(python_gen_cond_dep '>=dev-python/av-19.0.0[${PYTHON_USEDEP}]' python3_{12..14})
	>=dev-python/convertertools-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.11.9[${PYTHON_USEDEP}]
	>=dev-python/packaging-26.3[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.12.2[${PYTHON_USEDEP}]
	>=dev-python/propcache-0.5.4[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.13.5[${PYTHON_USEDEP}]
	>=dev-python/yarl-1.24.5[${PYTHON_USEDEP}]
	cli? (
		>=dev-python/pillow-12.3.0[${PYTHON_USEDEP}]
		>=dev-python/rich-15.0.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.27.2[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest