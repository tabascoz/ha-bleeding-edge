# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A Python implementation of the La Marzocco API"
HOMEPAGE="https://pypi.org/project/pylamarzocco/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/bleak-0.20.0[${PYTHON_USEDEP}]
    >=dev-python/aiohttp-3.8[${PYTHON_USEDEP}]
    >=dev-python/mashumaro-3.17[${PYTHON_USEDEP}]
    >=dev-python/cryptography-41.0[${PYTHON_USEDEP}]
    >=dev-python/bleak-retry-connector-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/aioresponses[${PYTHON_USEDEP}]
        dev-python/covdefaults[${PYTHON_USEDEP}]
        dev-python/coverage[${PYTHON_USEDEP}]
        dev-python/syrupy[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
    )
"

python_prepare_all() {
    # Remove any existing [build-system] section (upstream one is broken/incomplete for Gentoo)
    sed -i '/^\[build-system\]/,/^$/d' pyproject.toml || die

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

