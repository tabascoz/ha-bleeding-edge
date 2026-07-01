# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )
#PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="Fast, offline reverse geocoder"
HOMEPAGE="https://github.com/thampiman/reverse-geocoder"
LICENSE="LGPL"
SLOT="0"

KEYWORDS="~amd64 ~x86"

RDEPEND="
    >=dev-python/numpy-1.11.0[${PYTHON_USEDEP}]
    >=dev-python/scipy-0.17.1[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/numpy-1.11.0[${PYTHON_USEDEP}]
"

src_install() {
    distutils-r1_src_install
    dodoc README.txt
}
