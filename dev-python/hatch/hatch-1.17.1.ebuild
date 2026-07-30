# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

PYPI_PN="hatch"

DESCRIPTION="Modern, extensible Python project management"
HOMEPAGE="https://pypi.org/project/hatch/ https://github.com/pypa/hatch"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    >=dev-python/click-8.0.0[${PYTHON_USEDEP}]
    >=dev-python/hatchling-1.27[${PYTHON_USEDEP}]
    >=dev-python/packaging-24.2[${PYTHON_USEDEP}]
    >=dev-python/tomlkit-0.13.0[${PYTHON_USEDEP}]
    >=dev-python/userpath-1.9.0[${PYTHON_USEDEP}]
"

BDEPEND="
    ${RDEPEND}
"