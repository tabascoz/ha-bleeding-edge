# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python API for communication with Synology DSM"
HOMEPAGE="https://github.com/mib1185/py-synologydsm-api https://pypi.org/project/py-synologydsm-api/"
SRC_URI="$(pypi_wheel_url --unpack)"
S="${WORKDIR}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]
"


python_prepare_all() {
    # Fix missing [build-system] section in upstream pyproject.toml
    # Added proper newlines and blank line to prevent TOML parse error
    cat >> pyproject.toml <<- EOF || die

    [build-system]
    requires = ["setuptools >= 68.0"]
    build-backend = "setuptools.build_meta"
EOF

    distutils-r1_python_prepare_all
}

distutils_enable_tests pytest

