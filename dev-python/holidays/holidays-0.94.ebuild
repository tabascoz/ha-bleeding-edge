# Copyright 1999-2025 Gentoo Authors
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

RDEPEND="
    >=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
    <dev-python/python-dateutil-3[${PYTHON_USEDEP}]
"