# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="A retry layer for HTTPX."
HOMEPAGE="https://pypi.org/project/httpx-retries/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/httpx-0.20.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/hatchling-1.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest