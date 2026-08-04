# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Jellyfin API client for Python"
HOMEPAGE="https://pypi.org/project/jellyfin-apiclient-python/"

LICENSE="GPL-3.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
    >=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
    >=dev-python/urllib3-1.23[${PYTHON_USEDEP}]
    >=dev-python/websocket-client-0.57.0[${PYTHON_USEDEP}]
    >=dev-python/certifi-2019.3.9[${PYTHON_USEDEP}]
"

BDEPEND="
    dev-python/setuptools[${PYTHON_USEDEP}]
"

src_prepare() {
    default
    # Add missing build-backend to pyproject.toml
    if ! grep -q 'build-backend' pyproject.toml; then
	sed -i '/^\[build-system\]/a build-backend = "setuptools.build_meta"' pyproject.toml
    fi
}


distutils_enable_tests pytest

python_test() {
    cd "${BUILD_DIR}/src" || die
    pytest -v || die "Tests failed under ${EPYTHON}"
}

