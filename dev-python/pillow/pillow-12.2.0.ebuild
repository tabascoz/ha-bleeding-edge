# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

PYPI_PN="Pillow"
PYPI_NO_NORMALIZE=1

DESCRIPTION="Python Imaging Library (fork)"
HOMEPAGE="https://pypi.org/project/${PN}/"
LICENSE="HPND"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/pytest-timeout[${PYTHON_USEDEP}]
        dev-python/pytest-xdist[${PYTHON_USEDEP}]
        dev-python/defusedxml[${PYTHON_USEDEP}]
        dev-python/markdown2[${PYTHON_USEDEP}]
        dev-python/olefile[${PYTHON_USEDEP}]
        dev-python/packaging[${PYTHON_USEDEP}]
        dev-python/pyroma[${PYTHON_USEDEP}]
        dev-python/trove-classifiers[${PYTHON_USEDEP}]
        dev-python/arro3-compute[${PYTHON_USEDEP}]
        dev-python/arro3-core[${PYTHON_USEDEP}]
        dev-python/nanoarrow[${PYTHON_USEDEP}]
        dev-python/pyarrow[${PYTHON_USEDEP}]
    )
"