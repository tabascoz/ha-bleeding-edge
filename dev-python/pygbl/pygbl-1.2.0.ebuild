# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Parser for Silicon Labs GBL and EBL firmware images"
HOMEPAGE="https://pypi.org/project/pygbl/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="crypto lz4"

RDEPEND="
	dev-python/pyelftools[${PYTHON_USEDEP}]
	crypto? ( dev-python/cryptography[${PYTHON_USEDEP}] )
	lz4? ( dev-python/lz4[${PYTHON_USEDEP}] )
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"