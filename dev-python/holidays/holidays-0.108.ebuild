# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Generate and work with holidays in Python"
HOMEPAGE="https://github.com/vacanza/holidays https://pypi.org/project/holidays/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

# no efile here can keep the upper bound this one carries: the merged requirements
# pin python-dateutil at 4.0.0 and that is what is installed, so the bound is dropped
# and the floor raised to it - step 12 no-downgrade rule, measured 2026-11-09.
RDEPEND="
	>=dev-python/python-dateutil-4.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
