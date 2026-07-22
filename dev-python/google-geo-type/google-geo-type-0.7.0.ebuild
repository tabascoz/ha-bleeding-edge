# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Google Geo Type API client library - Protobuf definitions for geo types (Viewport, etc.)"
HOMEPAGE="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-geo-type
	https://pypi.org/project/google-geo-type/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/protobuf[${PYTHON_USEDEP}]
	>=dev-python/google-api-core-2.17.1[${PYTHON_USEDEP}]
	<dev-python/google-api-core-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	<dev-python/google-auth-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.59.0[${PYTHON_USEDEP}]
	<dev-python/grpcio-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.22.3[${PYTHON_USEDEP}]
	<dev-python/proto-plus-2.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"
distutils_enable_tests pytest

python_prepare_all() {
	# Fix hardcoded version in setup.py (common in Google API packages)
	sed -i "s/version=[\"']0\.6\.0[\"']/version=\"${PV}\"/" setup.py || die

	distutils-r1_python_prepare_all
}