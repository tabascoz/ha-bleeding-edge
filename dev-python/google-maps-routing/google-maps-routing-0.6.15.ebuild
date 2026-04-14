# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Google Maps Routing API client library"
HOMEPAGE="https://github.com/googleapis/google-cloud-python/tree/main/packages/google-maps-routing"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/google-api-core-1.34.1[grpc,${PYTHON_USEDEP}]
	<dev-python/google-api-core-3.0.0[grpc,${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.14.1[${PYTHON_USEDEP}]
	<dev-python/google-auth-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/google-geo-type-0.1.0[${PYTHON_USEDEP}]
	<dev-python/google-geo-type-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/proto-plus-1.22.3[${PYTHON_USEDEP}]
	<dev-python/proto-plus-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.2[${PYTHON_USEDEP}]
	<dev-python/protobuf-7.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest