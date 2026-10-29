# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit pypi distutils-r1

DESCRIPTION="pydantic xml extension"
HOMEPAGE="https://pypi.org/project/pydantic-xml/"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="lxml"

RDEPEND="
	>=dev-python/pydantic-2.6.0[${PYTHON_USEDEP}]
	!=dev-python/pydantic-2.10.0_beta1[${PYTHON_USEDEP}]
	lxml? ( >=dev-python/lxml-4.9.0[${PYTHON_USEDEP}] )
"
BDEPEND="
	>=dev-python/hatchling-1.0[${PYTHON_USEDEP}]
"