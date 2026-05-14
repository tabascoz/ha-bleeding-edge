# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# This line must come before inherit distutils-r1
DISTUTILS_USE_PEP517=setuptools

PYTHON_COMPAT=( python3_{11..14} )
PYTHON_REQ_USE="threads(+)"

inherit distutils-r1 pypi

DESCRIPTION="Alibaba Cloud API Gateway Util (utility functions for API Gateway SDKs)"
HOMEPAGE="https://github.com/aliyun/tea-python-util\
    https://pypi.org/project/alibabacloud-apigateway-util/"

# Latest version as of early 2026 is typically around 0.0.x – update when bumping
# Check https://pypi.org/project/alibabacloud-apigateway-util/#files for the current .tar.gz URL
#SRC_URI="https://files.pythonhosted.org/packages/source/a/alibabacloud_apigateway_util/alibabacloud_apigateway_util-0.0.1.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv ~x86 ~riscv"

RDEPEND="
    >=dev-python/alibabacloud-tea-0.4.0[${PYTHON_USEDEP}]
    >=dev-python/alibabacloud-tea-util-0.3.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
    dev-python/setuptools[${PYTHON_USEDEP}]
    dev-python/wheel[${PYTHON_USEDEP}]
"

# sdist usually unpacks to alibabacloud_apigateway_util-${PV} (with underscore)
S="${WORKDIR}/alibabacloud_apigateway_util-${PV}"

# Tests are typically not shipped in these utility sdists
RESTRICT="test"

pkg_postinst() {
    elog "Installed: ${PN}-${PV}"
    elog ""
    elog "This is a small utility package used together with API Gateway related SDKs"
    elog "(usually when working with the Tea-based / OpenAPI style SDKs)."
    elog ""
    elog "Common dependencies:"
    elog "  • dev-python/alibabacloud-tea"
    elog "  • dev-python/alibabacloud-tea-util"
    elog "  • possibly dev-python/alibabacloud-tea-openapi"
}
