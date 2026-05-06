# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Modern, reliable and async-ready Python client for Microsoft SignalR"
HOMEPAGE="https://github.com/eshizhan/pysignalr https://pypi.org/project/pysignalr/"

SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    >=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
    >=dev-python/websockets-12.0[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/hatchling-1.21.0[${PYTHON_USEDEP}]
"

IUSE="test"
RESTRICT="!test? ( test )"


distutils_enable_tests pytest