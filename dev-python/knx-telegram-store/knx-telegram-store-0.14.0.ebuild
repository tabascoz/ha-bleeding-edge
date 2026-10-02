# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A standalone, host-agnostic Python library for KNX telegram persistence."
HOMEPAGE="https://pypi.org/project/knx-telegram-store/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="postgres sqlite test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/defusedxml-0.7.1[${PYTHON_USEDEP}]
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
		>=dev-python/ruff-0.3[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.9[${PYTHON_USEDEP}]
		>=dev-python/aiosqlite-0.20[${PYTHON_USEDEP}]
		>=dev-python/types-defusedxml[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
pkg_postinst() {
	if use postgres; then
		elog "PostgreSQL support enabled."
	fi
	if use sqlite; then
		elog "SQLite support enabled."
	fi
}