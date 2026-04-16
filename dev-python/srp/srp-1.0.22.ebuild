# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="Secure Remote Password (SRP) protocol implementation for Python"
HOMEPAGE="https://github.com/cocagne/pysrp https://pypi.org/project/srp/"

SRC_URI="$(pypi_sdist_url)"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND=""
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"

# No tests are shipped in the sdist
RESTRICT="test"

python_prepare_all() {
    # Fix hardcoded version if present (common in older packages)
    sed -i "s/version=[\"']1\.0\.22[\"']/version=\"${PV}\"/" setup.py || true

    distutils-r1_python_prepare_all
}