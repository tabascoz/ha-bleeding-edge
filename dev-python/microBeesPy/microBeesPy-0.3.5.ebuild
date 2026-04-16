# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="microBees Python Library"
HOMEPAGE="https://github.com/microBeesTech/pythonSDK/ https://pypi.org/project/microBeesPy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

# Remove the tests directory during installation to avoid the stray files warning
python_install() {
    # Remove tests directory before installation
    rm -rf "${BUILD_DIR}/install/$(python_get_sitedir)/tests" || true
    
    distutils-r1_python_install
}

distutils_enable_tests pytest