# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Async Python client for Besen EV chargers over BLE"
HOMEPAGE="https://pypi.org/project/besen/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/bleak-retry-connector-3.10.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-8.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest