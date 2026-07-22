# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="PubNub Real-time push service in the cloud"
HOMEPAGE="http://pubnub.com https://github.com/pubnub/python/ https://pypi.org/project/pubnub/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	!dev-python/freenub[${PYTHON_USEDEP}]
	>=dev-python/pycryptodomex-3.3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.2[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/cbor2[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28[${PYTHON_USEDEP}]
	>=dev-python/h2-4.3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest