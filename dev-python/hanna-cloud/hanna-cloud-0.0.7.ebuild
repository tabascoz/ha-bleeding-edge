# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A Python client for the HannaCloud API"
HOMEPAGE="https://github.com/bestycame/hanna_cloud"

LICENSE="All-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="
    >=dev-python/requests-2.25.0[${PYTHON_USEDEP}]
    >=dev-python/pycryptodome-3.19.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"