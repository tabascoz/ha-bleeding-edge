# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="Hatch plugin to create a Git commit and tag when bumping version using regex"
HOMEPAGE="https://github.com/frankie567/hatch-regex-commit https://pypi.org/project/hatch-regex-commit/"

SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    >=dev-python/hatchling-1.21.0[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/hatchling-1.21.0[${PYTHON_USEDEP}]
"

# This is a pure build-time plugin, no runtime dependencies beyond hatchling
# No tests are shipped in the sdist
RESTRICT="test"

