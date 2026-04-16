# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="Strict separation of settings from code"
HOMEPAGE="https://github.com/HBNetwork/python-decouple https://pypi.org/project/python-decouple/"

SRC_URI="$(pypi_wheel_url --unpack)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND=""
DEPEND="${RDEPEND}"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"

# No tests are included in the sdist
RESTRICT="test"

S="${WORKDIR}"

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
