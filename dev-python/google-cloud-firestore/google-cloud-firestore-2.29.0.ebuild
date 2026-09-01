# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )
inherit distutils-r1 pypi

DESCRIPTION="Google Cloud Firestore API client library"
HOMEPAGE="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-firestore https://pypi.org/project/google-cloud-firestore"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/google-api-core-2.25.0[grpc,${PYTHON_USEDEP}]
	<dev-python/google-api-core-3.0.0[grpc,${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	<dev-python/google-auth-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-core-2.0.0[${PYTHON_USEDEP}]
	<dev-python/google-cloud-core-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.59.0[${PYTHON_USEDEP}]
	<dev-python/grpcio-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.26.1[${PYTHON_USEDEP}]
	<dev-python/proto-plus-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-6.33.5[${PYTHON_USEDEP}]
	<dev-python/protobuf-8.0.0[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest