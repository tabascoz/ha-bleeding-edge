
# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="Python classes generated from the GTFS-realtime protocol buffer specification"
HOMEPAGE="https://github.com/MobilityData/gtfs-realtime-bindings https://pypi.org/project/gtfs-realtime-bindings/"

SRC_URI="$(pypi_sdist_url)"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

# No runtime dependencies — it's pure generated Python code (protobuf classes)
RDEPEND=""
DEPEND="${RDEPEND}"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"
    
# No tests are included in the sdist
RESTRICT="test"
    
python_prepare_all() {
    # Fix hardcoded version if present in setup.py
    sed -i "s/version=[\"']2\.0\.0[\"']/version=\"${PV}\"/" setup.py || true
    
    distutils-r1_python_prepare_all
}