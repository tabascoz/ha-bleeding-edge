# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=uv-build
PYPI_PN=${PN/_/-}
inherit distutils-r1 pypi

DESCRIPTION="A library to parse MT940 files and returns smart Python collections for statistics and manipulation."
HOMEPAGE="https://github.com/WoLpH/mt940 https://pypi.org/project/mt-940/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	!dev-python/mt_940[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest