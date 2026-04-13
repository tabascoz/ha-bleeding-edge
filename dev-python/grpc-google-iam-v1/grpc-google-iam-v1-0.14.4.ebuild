# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="GRPC library for the google-iam-v1 service"
HOMEPAGE="https://github.com/googleapis/googleapis https://pypi.org/project/grpc-google-iam-v1/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/grpcio-1.44.0[${PYTHON_USEDEP}]
    <dev-python/grpcio-2.0.0[${PYTHON_USEDEP}]
    >=dev-python/googleapis-common-protos-1.63.2[${PYTHON_USEDEP}]
    <dev-python/googleapis-common-protos-2.0.0[${PYTHON_USEDEP}]
    >=dev-python/protobuf-4.25.8[${PYTHON_USEDEP}]
    <dev-python/protobuf-8.0.0[${PYTHON_USEDEP}]
"

BDEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest

python_install_all() {
    distutils-r1_python_install_all
    find "${ED}" -name '*.pth' -delete || die
}