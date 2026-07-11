# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

PYPI_PN="pyoverkiz"

DESCRIPTION="A fully asynchronous API client for interaction with smart devices connected to OverKiz, supporting multiple vendors such as Somfy TaHoma and Atlantic Cozytouch."
HOMEPAGE="https://github.com/iMicknl/python-overkiz-api https://pypi.org/project/pyoverkiz/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.10.3[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-22.2[${PYTHON_USEDEP}]
	>=dev-python/python-backoff-1.10.0[${PYTHON_USEDEP}]
	<dev-python/python-backoff-3.0[${PYTHON_USEDEP}]
	>=dev-python/cattrs-23.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
