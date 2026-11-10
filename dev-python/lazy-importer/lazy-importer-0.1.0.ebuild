# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=flit
inherit pypi distutils-r1

DESCRIPTION="A context manager for portable, opt-in lazy imports"
HOMEPAGE="https://pypi.org/project/lazy-importer/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND=""
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"