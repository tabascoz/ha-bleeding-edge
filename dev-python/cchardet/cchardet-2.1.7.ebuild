# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Universal character encoding detector (fork of chardet)"
HOMEPAGE="https://pypi.org/project/cchardet/"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND=""
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"