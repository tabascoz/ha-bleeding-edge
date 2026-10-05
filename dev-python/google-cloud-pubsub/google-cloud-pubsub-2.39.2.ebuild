# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 edo pypi

DESCRIPTION="Google Cloud Pub/Sub API client library"
HOMEPAGE="https://github.com/googleapis/google-cloud-python"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND=">=dev-python/google-api-core-2.25.0[${PYTHON_USEDEP}]
	<dev-python/google-api-core-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	<dev-python/google-auth-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.59.0[${PYTHON_USEDEP}]
	<dev-python/grpcio-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-status-1.59.0[${PYTHON_USEDEP}]
	<dev-python/grpcio-status-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/grpc-google-iam-v1-0.14.2[${PYTHON_USEDEP}]
	<dev-python/grpc-google-iam-v1-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.27.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.27.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-6.33.5[${PYTHON_USEDEP}]
	<dev-python/protobuf-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.26.1[${PYTHON_USEDEP}]
	<dev-python/proto-plus-2.0.0[${PYTHON_USEDEP}]"

EPYTEST_PLUGINS=( flaky pytest-asyncio )
distutils_enable_tests pytest

python_compile() {
	distutils-r1_python_compile
	edo find "${BUILD_DIR}" -name '*.pth' -delete
}

src_test() {
	edo rm -r google
	distutils-r1_src_test
}

python_test() {
	distutils_write_namespace google
	epytest -v tests
}