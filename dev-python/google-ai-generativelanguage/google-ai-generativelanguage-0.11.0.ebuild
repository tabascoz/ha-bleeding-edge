# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
#PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi


DESCRIPTION="Google Ai Generativelanguage API client library"
HOMEPAGE="https://github.com/googleapis/google-cloud-python https://pypi.org/project/google-ai-generativelanguage/"

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
	python3_14? ( >=dev-python/grpcio-1.75.1[${PYTHON_USEDEP}] )
	<dev-python/grpcio-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.22.3[${PYTHON_USEDEP}]
	python3_13? ( >=dev-python/proto-plus-1.25.0[${PYTHON_USEDEP}] )
	<dev-python/proto-plus-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.25.8[${PYTHON_USEDEP}]
	<dev-python/protobuf-8.0.0[${PYTHON_USEDEP}]
"