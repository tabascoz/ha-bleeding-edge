# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Separate test code from test cases in pytest"
HOMEPAGE="
	https://pypi.org/project/pytest-cases/
	https://github.com/smarie/python-pytest-cases
"

LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/decopatch[${PYTHON_USEDEP}]
	>=dev-python/makefun-1.15.1[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest

src_prepare() {
	sed "/pkg_resources/d" -i setup.py || die
	distutils-r1_src_prepare
}