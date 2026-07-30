# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python Client for the OHF Matter Server"
HOMEPAGE="https://github.com/matter-js/matterjs-server/tree/main/python_client"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/dacite[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
	test? (
		dev-python/codespell-2.4.1[${PYTHON_USEDEP}]
		dev-python/isort-7.0.0[${PYTHON_USEDEP}]
		dev-python/mypy-1.19.1[${PYTHON_USEDEP}]
		dev-python/pylint-4.0.4[${PYTHON_USEDEP}]
		dev-python/pytest-9.0[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio-0.24[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-cov-7.0[${PYTHON_USEDEP}]
		dev-python/ruff-0.14.9[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest