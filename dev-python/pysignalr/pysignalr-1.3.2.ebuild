# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Modern, reliable and async-ready Python client for Microsoft SignalR"
HOMEPAGE="https://github.com/baking-bad/pysignalr https://pypi.org/project/pysignalr/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/msgpack-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-16.0[${PYTHON_USEDEP}]
	<dev-python/websockets-18.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/hatchling-1.21.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest
PYPI_PN="pysignalr"
