# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
PYTHON_REQ_USE="threads(+)"
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Alibaba Cloud Tea Util (utility functions for Tea-based SDKs)"
HOMEPAGE="https://github.com/aliyun/tea-python-util\
    https://pypi.org/project/alibabacloud-tea-util/"

# Latest version as of early 2026: 0.3.11
# You can update PV and the hash part when bumping
#SRC_URI="https://files.pythonhosted.org/packages/e9/ee/ea90be94ad781a5055db29556744681fc71190ef444ae53adba45e1be5f3/alibabacloud_tea_util-0.3.14.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv ~x86"

# Common dependencies for Tea-based SDKs
RDEPEND="
    >=dev-python/alibabacloud-tea-0.4.0[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
    dev-python/setuptools[${PYTHON_USEDEP}]
    dev-python/wheel[${PYTHON_USEDEP}]
"

# sdist usually unpacks to alibabacloud_tea_util-${PV} (underscore)
S="${WORKDIR}/alibabacloud_tea_util-${PV}"

# Tests are typically not included in sdists
RESTRICT="test"

pkg_postinst() {
    elog "This package provides utility functions used by many modern Alibaba Cloud Python SDKs"
    elog "(especially those based on the Tea runtime)."
    elog ""
    elog "It usually works together with dev-python/alibabacloud-tea"
    elog "Example usage: alibabacloud-tea-openapi, alibabacloud-iot-*, etc."
}
