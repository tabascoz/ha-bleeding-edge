# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="An async implementation of PyAcaia"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="GPL-3.0-only"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/bleak-0.20.2[${PYTHON_USEDEP}]
    >=dev-python/bleak-retry-connector-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/syrupy[${PYTHON_USEDEP}]
        dev-python/covdefaults[${PYTHON_USEDEP}]
        dev-python/coverage[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest