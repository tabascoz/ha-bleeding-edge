# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Library to interface an Envertech EVT-800 device"
HOMEPAGE="https://github.com/daniel-bergmann-00/pyenvertech-evt800"
PYPI_PN="pyenvertechevt800"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND=""
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"