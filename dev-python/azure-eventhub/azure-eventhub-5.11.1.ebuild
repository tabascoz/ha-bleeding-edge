# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Microsoft Azure Event Hubs Client Library for Python"
HOMEPAGE="https://pypi.org/project/${PN}/"

#SRC_URI="$(pypi_wheel_url) --unpack"
SRC_URI="$(pypi_wheel_url --unpack)"
S="${WORKDIR}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="
    >=dev-python/azure-core-1.14.0[${PYTHON_USEDEP}]
    <dev-python/azure-core-2.0.0[${PYTHON_USEDEP}]
    >=dev-python/typing-extensions-4.0.1[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"


python_prepare_all() {
    # === Fix missing [build-system] section (same as aioacaia) ===
    cat >> pyproject.toml <<- EOF || die
    [build-system]
    requires = ["setuptools >= 68.0"]
    build-backend = "setuptools.build_meta"
EOF
                
    distutils-r1_python_prepare_all
}