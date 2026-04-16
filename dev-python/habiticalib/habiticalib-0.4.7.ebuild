# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
#PYPI_PN="Habiticalib"
#PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Asynchronous Python client library for the Habitica API"
HOMEPAGE="https://pypi.org/project/Habiticalib/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
    >=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
    >=dev-python/mashumaro-3.13[${PYTHON_USEDEP}]
    >=dev-python/orjson-3.11.7[${PYTHON_USEDEP}]
    >=dev-python/pillow-11.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest