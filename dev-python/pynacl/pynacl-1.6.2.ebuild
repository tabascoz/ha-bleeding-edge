# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

PYPI_PN="PyNaCl"
#PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python binding to the Networking and Cryptography (NaCl) library"
HOMEPAGE="https://github.com/pyca/pynacl/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test docs"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/cffi-2.0.0[${PYTHON_USEDEP}]
    dev-libs/libsodium
"
BDEPEND="
    test? (
        >=dev-python/pytest-7.4.0[${PYTHON_USEDEP}]
        >=dev-python/pytest-cov-2.10.1[${PYTHON_USEDEP}]
        >=dev-python/pytest-xdist-3.5.0[${PYTHON_USEDEP}]
        >=dev-python/hypothesis-3.27.0[${PYTHON_USEDEP}]
    )
    docs? (
        <dev-python/sphinx-7[${PYTHON_USEDEP}]
        dev-python/sphinx-rtd-theme[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest