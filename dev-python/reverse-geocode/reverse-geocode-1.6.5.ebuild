# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="Reverse geocode latitude/longitude coordinates to nearest country, state, and city"
HOMEPAGE="https://github.com/richardpenman/reverse_geocode https://pypi.org/project/reverse-geocode/"

SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

# No runtime dependencies (pure Python with embedded data)
RDEPEND=""
DEPEND="${RDEPEND}"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"

# The package ships a large data file (~3.5 MB) – no tests in the sdist
RESTRICT="test"

python_prepare_all() {
    # Fix hardcoded version in setup.py (common with old-style packages)
    sed -i "s/version=\"1\.6\.5\"/version=\"${PV}\"/" setup.py || die

    distutils-r1_python_prepare_all
}
