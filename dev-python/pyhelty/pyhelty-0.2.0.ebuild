# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async client library for Helty Flow VMC (mechanical ventilation) units with the smart Wi-Fi interface"
HOMEPAGE="https://pypi.org/project/pyhelty/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		>=dev-python/pytest-8.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest