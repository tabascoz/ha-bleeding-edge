# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Pytest plugin for testing async python code"
HOMEPAGE="https://github.com/klen/pytest-aio https://pypi.org/project/pytest-aio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/pytest[${PYTHON_USEDEP}]
	dev-python/curio-compat[${PYTHON_USEDEP}]
	dev-python/trio[${PYTHON_USEDEP}]
	dev-python/uvloop[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest