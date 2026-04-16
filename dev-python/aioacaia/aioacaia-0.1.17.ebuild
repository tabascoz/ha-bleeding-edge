# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="An async implementation of PyAcaia"
HOMEPAGE="https://pypi.org/project/${PN}/"

SRC_URI="$(pypi_sdist_url)"

LICENSE="AGPL-3.0-only"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/bleak-0.20.2[${PYTHON_USEDEP}]
    >=dev-python/bleak-retry-connector-4.0.0[${PYTHON_USEDEP}]
    >=dev-python/setuptools-scm-8.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/covdefaults[${PYTHON_USEDEP}]
        dev-python/coverage[${PYTHON_USEDEP}]
        dev-python/syrupy[${PYTHON_USEDEP}]
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
    )
"

python_prepare_all() {
    # Fix missing [build-system] section in upstream pyproject.toml
    # This is the root cause of "Unable to obtain build-backend from pyproject.toml"
    cat >> pyproject.toml <<- EOF || die
    [build-system]
    requires = ["setuptools >= 68.0"]
    build-backend = "setuptools.build_meta"
EOF
    
    distutils-r1_python_prepare_all
}

distutils_enable_tests pytest