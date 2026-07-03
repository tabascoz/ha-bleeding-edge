# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Support for communication with Greencell devices using by Home Assistant integration"
HOMEPAGE="https://pypi.org/project/greencell-client/"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="mirror"

RDEPEND=""
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"