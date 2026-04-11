# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async Python client for the IDrive e2 Get Region Endpoint API (returns only endpoint URL)"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
    >=dev-python/typing-extensions-4.9.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        >=dev-python/pytest-8.0[${PYTHON_USEDEP}]
        >=dev-python/pytest-asyncio-0.23[${PYTHON_USEDEP}]
        >=dev-python/aioresponses-0.7.6[${PYTHON_USEDEP}]
        >=dev-python/ruff-0.5.0[${PYTHON_USEDEP}]
        >=dev-python/mypy-1.9.0[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest