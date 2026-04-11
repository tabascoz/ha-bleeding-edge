# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Async Python client for NRGkick Gen2 EV charger local REST API"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.13.2[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        >=dev-python/pytest-9.0.2[${PYTHON_USEDEP}]
        >=dev-python/pytest-asyncio-1.3.0[${PYTHON_USEDEP}]
        >=dev-python/pytest-cov-7.0.0[${PYTHON_USEDEP}]
        >=dev-python/aresponses-3.0.0[${PYTHON_USEDEP}]
        >=dev-python/ruff-0.14.9[${PYTHON_USEDEP}]
        >=dev-python/mypy-1.19.0[${PYTHON_USEDEP}]
        >=dev-python/build-1.3.0[${PYTHON_USEDEP}]
        >=dev-python/twine-6.2.0[${PYTHON_USEDEP}]
        >=dev-python/pre-commit-4.5.0[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest