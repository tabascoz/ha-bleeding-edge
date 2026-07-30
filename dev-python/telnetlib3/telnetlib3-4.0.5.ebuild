# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

PYPI_PN="telnetlib3"

DESCRIPTION="Telnet and SSH servers implementing RFC 854 and RFC 6144"
HOMEPAGE="https://pypi.org/project/telnetlib3/ https://github.com/jquast/telnetlib3"
LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    >=dev-python/asyncssh-2.18[${PYTHON_USEDEP}]
"

BDEPEND="
    ${RDEPEND}
"