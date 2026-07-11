# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python API for communication with Synology DSM"
HOMEPAGE="https://github.com/mib1185/py-synologydsm-api https://pypi.org/project/py-synologydsm-api/"
PYPI_PN="py-synologydsm-api"
SRC_URI="$(pypi_wheel_url --unpack)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

S="${WORKDIR}"
python_prepare_all() {
    # === Fix missing [build-system] section (same as aioacaia) ===
    cat >> pyproject.toml <<- EOF || die
[build-system]
requires = ["setuptools >= 68.0"]
build-backend = "setuptools.build_meta"
EOF

    distutils-r1_python_prepare_all
}