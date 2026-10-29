# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
PYPI_PN="telnetlib3"
inherit pypi distutils-r1


DESCRIPTION="Python Telnet server and client CLI and Protocol library"
HOMEPAGE="https://pypi.org/project/telnetlib3/ https://github.com/jquast/telnetlib3"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/wcwidth-0.6.0[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
"
