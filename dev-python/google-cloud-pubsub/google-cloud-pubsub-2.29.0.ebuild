# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

MY_PN="${PN//google-cloud/python}"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Google Cloud Pub/Sub API client library"
HOMEPAGE="https://github.com/googleapis/python-pubsub"
SRC_URI="https://github.com/googleapis/${MY_PN}/archive/v${PV}.tar.gz -> ${MY_P}.gh.tar.gz"
S="${WORKDIR}/${MY_P}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/google-api-core-1.34.0[grpc,${PYTHON_USEDEP}]
	<dev-python/google-api-core-3.0.0[grpc,${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	<dev-python/google-auth-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-1.51.3[${PYTHON_USEDEP}]
	<dev-python/grpcio-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-status-1.33.2[${PYTHON_USEDEP}]
	>=dev-python/grpc-google-iam-v1-0.12.4[${PYTHON_USEDEP}]
	<dev-python/grpc-google-iam-v1-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.27.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-sdk-1.27.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}]
	<dev-python/protobuf-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.22.0[${PYTHON_USEDEP}]
	<dev-python/proto-plus-2.0.0[${PYTHON_USEDEP}]
	python_version >= "3.11" ? ( >=dev-python/proto-plus-1.22.2[${PYTHON_USEDEP}] )
	python_version >= "3.13" ? ( >=dev-python/proto-plus-1.25.0[${PYTHON_USEDEP}] )
"
BDEPEND="test? ( dev-python/flaky[${PYTHON_USEDEP}] )"

EPYTEST_PLUGINS=( pytest-asyncio )
distutils_enable_tests pytest

python_compile() {
	distutils-r1_python_compile
	find "${BUILD_DIR}" -name '*.pth' -delete || die
}

src_test() {
	rm -r google || die "rm failed"
	distutils-r1_src_test
}

python_test() {
	distutils_write_namespace google
	epytest -v tests || die "tests failed with ${EPYTHON}"
}