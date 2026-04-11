# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A package to interact with Tedee locks using asyncio"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
    >=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        =dev-python/aioresponses-0.7.8[${PYTHON_USEDEP}]
        =dev-python/covdefaults-2.3.0[${PYTHON_USEDEP}]
        =dev-python/coverage-7.6.7[${PYTHON_USEDEP}]
        =dev-python/syrupy-4.7.2[${PYTHON_USEDEP}]
        =dev-python/pytest-8.3.3[${PYTHON_USEDEP}]
        =dev-python/pytest-asyncio-0.24.0[${PYTHON_USEDEP}]
        =dev-python/pytest-cov-6.0.0[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest