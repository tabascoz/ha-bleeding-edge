# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
#PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="Control your MotionMount Signature TVM7675 Pro using Python"
HOMEPAGE="https://github.com/vogelsproducts/python-MotionMount https://pypi.org/project/python-MotionMount/"
SRC_URI="$(pypi_wheel_url --unpack)"

S="${WORKDIR}/motionmount"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

python_prepare_all() {
    # === Fix missing [build-system] section (same as aioacaia) ===
    cat >> pyproject.toml <<- EOF || die
    [build-system]
    requires = ["setuptools >= 68.0"]
    build-backend = "setuptools.build_meta"
EOF

    distutils-r1_python_prepare_all
}

