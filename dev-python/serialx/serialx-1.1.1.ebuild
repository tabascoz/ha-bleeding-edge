# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Serial library with native async support for Windows and POSIX"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="esphome dev"
RESTRICT="!test? ( test )"

RDEPEND="
    dev-python/typing-extensions[${PYTHON_USEDEP}]
    esphome? ( >=dev-python/aioesphomeapi-44.5.1[${PYTHON_USEDEP}] )
    dev? (
        dev-python/ruff[${PYTHON_USEDEP}]
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pre-commit[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/pytest-timeout[${PYTHON_USEDEP}]
        dev-python/pytest-xdist[${PYTHON_USEDEP}]
        dev-python/psutil[${PYTHON_USEDEP}]
        >=dev-python/aioesphomeapi-44.5.1[${PYTHON_USEDEP}]
    )
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest