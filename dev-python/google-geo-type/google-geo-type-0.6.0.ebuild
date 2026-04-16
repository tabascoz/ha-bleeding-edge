# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Google Geo Type API client library - Protobuf definitions for geo types (Viewport, etc.)"
HOMEPAGE="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-geo-type
    https://pypi.org/project/google-geo-type/"

SRC_URI="$(pypi_sdist_url)"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    dev-python/protobuf[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"

# No tests shipped in the sdist
RESTRICT="test"

python_prepare_all() {
    # Fix hardcoded version in setup.py (common in Google API packages)
    sed -i "s/version=[\"']0\.6\.0[\"']/version=\"${PV}\"/" setup.py || die

    distutils-r1_python_prepare_all
}
