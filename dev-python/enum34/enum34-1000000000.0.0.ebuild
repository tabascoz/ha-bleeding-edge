# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Dummy package for enum34 compatibility (enum is built into Python 3)"
HOMEPAGE="https://pypi.org/project/enum34/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND=""
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"

src_unpack() {
	mkdir -p "${S}"
}

src_compile() {
	:
}

src_install() {
	:
}