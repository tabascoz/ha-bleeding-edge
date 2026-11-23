# Copyright 2019-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Automated testing for the examples in your code and documentation."
HOMEPAGE="
	https://github.com/simplistix/sybil/
	https://pypi.org/project/sybil/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/pytest-8[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/myst-parser[${PYTHON_USEDEP}]
		dev-python/seedir[${PYTHON_USEDEP}]
		>=dev-python/testfixtures-12[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest