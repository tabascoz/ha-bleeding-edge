# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=poetry
inherit pypi distutils-r1

DESCRIPTION="Asynchronous Python client for the Powerfox devices"
HOMEPAGE="https://pypi.org/project/powerfox/"
LICENSE="None"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
    >=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
    >=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
    <dev-python/mashumaro-4.0[${PYTHON_USEDEP}]
    >=dev-python/orjson-3.9.9[${PYTHON_USEDEP}]
    >=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"
