# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
#PYPI_NO_NORMALIZE=1 
inherit distutils-r1 pypi

DESCRIPTION="A library to send rc signals with the RaspyRFM module"
HOMEPAGE="https://github.com/markusressel/raspyrfm-client https://pypi.org/project/raspyrfm-client/"
SRC_URI="$(pypi_wheel_url --unpack)"
LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

S="${WORKDIR}"

python_prepare_all() {
    cat >> pyproject.toml <<- EOF || die
    [build-system]
    requires = ["setuptools >= 68.0"]
    build-backend = "setuptools.build_meta"
EOF

    distutils-r1_python_prepare_all
}

distutils_enable_tests pytest