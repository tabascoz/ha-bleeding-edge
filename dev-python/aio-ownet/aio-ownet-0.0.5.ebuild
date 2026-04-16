# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Async OWFS (owserver) client"
HOMEPAGE="https://pypi.org/project/${PN}/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cli"

RDEPEND="
cli? ( >=dev-python/click-8.0.1[${PYTHON_USEDEP}] )
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"
distutils_enable_tests pytest
