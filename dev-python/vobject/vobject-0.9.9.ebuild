# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYPI_NO_NORMALIZE=1


PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A full-featured Python package for parsing and creating iCalendar and vCard files"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"

RESTRICT="!test? ( test )"

RDEPEND="
    dev-python/pytz[${PYTHON_USEDEP}]
    dev-python/six[${PYTHON_USEDEP}]
    python_version_lt_3_10? ( >=dev-python/python-dateutil-2.5.0[${PYTHON_USEDEP}] )
    python_version_ge_3_10? ( >=dev-python/python-dateutil-2.7.0[${PYTHON_USEDEP}] )
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest