# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Google Cloud API client core library"
HOMEPAGE="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-cloud-core https://pypi.org/project/google-cloud-core/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="grpc test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/google-api-core-2.28.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	grpc? (
		<dev-python/grpcio-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/grpcio-1.59.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest
pkg_postinst() {
	if use grpc; then
		ewarn "The grpc extra is enabled. Make sure you have the required gRPC dependencies installed."
	fi
}