# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A GeoRSS client library."
HOMEPAGE="https://github.com/exxamalte/python-georss-client https://pypi.org/project/georss-client/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
    >=dev-python/haversine-2.9.0[${PYTHON_USEDEP}]
    >=dev-python/xmltodict-1.0.4[${PYTHON_USEDEP}]
    >=dev-python/requests-2.34.2[${PYTHON_USEDEP}]
    >=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-timeout[${PYTHON_USEDEP}]
        dev-python/pytest-xdist[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/coverage[${PYTHON_USEDEP}]
        dev-python/mock[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest