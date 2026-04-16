# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Dithering algorithms optimized for e-paper / e-ink displays"
HOMEPAGE="https://github.com/OpenDisplay-org/epaper-dithering
    https://pypi.org/project/epaper-dithering/"

SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    dev-python/pillow[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"

IUSE="test"
RESTRICT="!test? ( test )"

# Tests are usually minimal or not shipped in sdist
distutils_enable_tests pytest