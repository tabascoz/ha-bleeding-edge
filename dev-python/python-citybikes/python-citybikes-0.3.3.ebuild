# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Client interface for the Citybikes API"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    dev-python/aiohttp[${PYTHON_USEDEP}]
    dev-python/requests[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

python_prepare_all() {

    # Add a clean, working build-system section
    cat >> pyproject.toml <<- 'EOF' || die

    [build-system]
    requires = ["setuptools >= 68.0"]
    build-backend = "setuptools.build_meta"
EOF

    # Fix hardcoded version if it exists
    sed -i "s/version = [\"']1\.11\.0[\"']/version = \"${PV}\"/" pyproject.toml || true

    distutils-r1_python_prepare_all
}

distutils_enable_tests pytest