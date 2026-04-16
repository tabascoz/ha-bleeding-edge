# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
#PYPI_PN="HueBLE"
#PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="Python module for controlling and monitoring Bluetooth Philips Hue bulbs"
HOMEPAGE="https://pypi.org/project/HueBLE/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/bleak-0.19.0[${PYTHON_USEDEP}]
    dev-python/bleak-retry-connector[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
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