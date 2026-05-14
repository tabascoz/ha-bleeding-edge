# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi 
DESCRIPTION="Alibaba Cloud IoT API Gateway SDK for Python (older version)"
HOMEPAGE="https://developer.aliyun.com/tools/sdk#/python"
SRC_URI="https://files.pythonhosted.org/packages/16/5c/d8e90380b6c79d6410d83dc1af0404f965df8c68f3a0af77ddd289aec55e/alibabacloud_iot_api_gateway-0.0.4.tar.gz"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"
RDEPEND="dev-python/aliyun-python-sdk-core[${PYTHON_USEDEP}]"
DEPEND="${RDEPEND}"
