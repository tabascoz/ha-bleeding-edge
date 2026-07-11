# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A standalone, host-agnostic Python library for KNX telegram persistence."
HOMEPAGE="https://pypi.org/project/knx-telegram-store/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="postgres sqlite test"
RESTRICT="!test? ( test )"

RDEPEND="
	postgres? (
		>=dev-python/asyncpg-0.29[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}]
	)
	sqlite? (
		>=dev-python/aiosqlite-0.20[${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		>=dev-python/pytest-8.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4.1[${PYTHON_USEDEP}]
		>=dev-python/aiosqlite-0.20[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest