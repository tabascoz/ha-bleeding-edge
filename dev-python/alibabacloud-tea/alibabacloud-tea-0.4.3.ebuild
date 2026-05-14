# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
PYTHON_REQ_USE="threads(+)"
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi
#inherit distutils-r1 

DESCRIPTION="Alibaba Cloud Tea (core runtime library for modern OpenAPI SDKs)"
HOMEPAGE="https://github.com/aliyun/tea-python\
    https://pypi.org/project/alibabacloud-tea/"
#SRC_URI="$(pypi_sdist_url)"
MY_PN="alibabacloud-tea"
MY_HASH="9a/7d/b22cb9a0d4f396ee0f3f9d7f26b76b9ed93d4101add7867a2c87ed2534f5"
SRC_URI="https://files.pythonhosted.org/packages/${MY_HASH}/${MY_PN}-${PV}.tar.gz"
S="${WORKDIR}/alibabacloud-tea-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv ~x86"

# No runtime dependencies listed on PyPI (very lightweight base runtime)
RDEPEND="
    ~dev-python/alibabacloud-tea-util-0.3.14[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
BDEPEND="
    dev-python/setuptools[${PYTHON_USEDEP}]
    dev-python/wheel[${PYTHON_USEDEP}]
"

# Use PEP 517 build backend (modern setuptools + PEP 660 editable installs support)

# No tests included in sdist
RESTRICT="test"

pkg_postinst() {
    elog "This is the core Tea runtime library used by modern Alibaba Cloud Python SDKs"
    elog "(alibabacloud-tea-openapi, alibabacloud-iot-*, etc.) after ~2020."
    elog ""
    elog "The old aliyun-python-sdk-* family uses aliyun-python-sdk-core instead."
    elog "Most new service SDKs depend on this package (alibabacloud-tea)."
}
