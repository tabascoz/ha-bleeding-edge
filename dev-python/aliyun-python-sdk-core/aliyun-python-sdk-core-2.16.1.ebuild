# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
PYTHON_REQ_USE="threads(+)"
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="The core module of Alibaba Cloud (Aliyun) Python SDK"
HOMEPAGE="https://github.com/aliyun/aliyun-openapi-python-sdk/tree/master/aliyun-python-sdk-core\
    https://pypi.org/project/aliyun-python-sdk-core/"
#SRC_URI="$(pypi_wheel_url)"
SRC_URI="$(pypi_wheel_url --unpack)"
S="${WORKDIR}/aliyunsdkcore"



LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="
	>=dev-python/cryptography-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/jmespath-0.9.3[${PYTHON_USEDEP}]
	<dev-python/jmespath-2.0.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

pkg_postinst() {
	elog "This is the core library required by most Alibaba Cloud service SDKs"
	elog "(e.g. aliyun-python-sdk-iot, aliyun-python-sdk-ecs, etc.)"
	elog ""
	elog "Note: The V1.0 family of SDKs is considered legacy by Alibaba Cloud."
	elog "They recommend using the newer OpenAPI V2 / Tea-based SDKs where possible."
}
