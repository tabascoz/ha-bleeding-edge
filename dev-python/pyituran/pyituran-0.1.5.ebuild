# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A module to interact with Ituran's web service."
HOMEPAGE="https://github.com/shmuelzon/pyituran https://pypi.org/project/pyituran/"
SRC_URI="$(pypi_wheel_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    dev-python/aiohttp[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/black[${PYTHON_USEDEP}]
        dev-python/coverage[${PYTHON_USEDEP}]
        dev-python/flake8[${PYTHON_USEDEP}]
        dev-python/pep8-naming[${PYTHON_USEDEP}]
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/setuptools[${PYTHON_USEDEP}]
        dev-python/wheel[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest