# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Asynchronous Python API for Solarman devices"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        >=dev-python/pytest-7.0[${PYTHON_USEDEP}]
        >=dev-python/pytest-asyncio-0.21.0[${PYTHON_USEDEP}]
        >=dev-python/pytest-mock-3.10.0[${PYTHON_USEDEP}]
        >=dev-python/flake8-6.0.0[${PYTHON_USEDEP}]
        >=dev-python/mypy-1.0.0[${PYTHON_USEDEP}]
        >=dev-python/black-23.0.0[${PYTHON_USEDEP}]
        >=dev-python/isort-5.12.0[${PYTHON_USEDEP}]
        >=dev-python/types-requests-2.31.0[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest