# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Google speech recognition technologies"
HOMEPAGE="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-speech https://pypi.org/project/google-cloud-speech/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	>=dev-python/google-api-core-2.11.0[${PYTHON_USEDEP}]
	<dev-python/google-api-core-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	<dev-python/google-auth-3.0.0[${PYTHON_USEDEP}]
	!=dev-python/google-auth-2.24.0[${PYTHON_USEDEP}]
	!=dev-python/google-auth-2.25.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.33.2[${PYTHON_USEDEP}]
	<dev-python/grpcio-2.0.0[${PYTHON_USEDEP}]
	python_gen_cond_dep '>=dev-python/grpcio-1.75.1[${PYTHON_USEDEP}]' '>=3.14'
	>=dev-python/proto-plus-1.22.3[${PYTHON_USEDEP}]
	<dev-python/proto-plus-2.0.0[${PYTHON_USEDEP}]
	python_gen_cond_dep '>=dev-python/proto-plus-1.25.0[${PYTHON_USEDEP}]' '>=3.13'
	>=dev-python/protobuf-4.25.8[${PYTHON_USEDEP}]
	<dev-python/protobuf-8.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_install_all() {
	distutils-r1_python_install_all
	find "${ED}" -name '*.pth' -delete || die
}