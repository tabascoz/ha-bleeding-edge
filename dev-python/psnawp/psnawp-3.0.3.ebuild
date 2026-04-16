# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=poetry
inherit pypi distutils-r1

DESCRIPTION="Python API Wrapper for PlayStation Network API"
HOMEPAGE="https://pypi.org/project/psnawp/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="
    dev-python/pycountry[${PYTHON_USEDEP}]
    dev-python/pyrate-limiter[${PYTHON_USEDEP}]
    dev-python/requests[${PYTHON_USEDEP}]
    dev-python/typing-extensions[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"