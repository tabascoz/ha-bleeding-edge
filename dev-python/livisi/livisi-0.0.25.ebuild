# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Connection library for the abandoned Livisi Smart Home system"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
    >=dev-python/colorlog-6.8.2[${PYTHON_USEDEP}]
    >=dev-python/aiohttp-3.8.5[${PYTHON_USEDEP}]
    >=dev-python/websockets-11.0.3[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"