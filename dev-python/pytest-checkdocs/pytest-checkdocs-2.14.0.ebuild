# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="check the README when running tests"
HOMEPAGE="https://pypi.org/project/pytest-checkdocs/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/docutils-0.15[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/jaraco-packaging-9.5[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest
