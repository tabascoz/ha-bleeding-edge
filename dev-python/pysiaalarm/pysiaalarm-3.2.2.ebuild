# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python package for creating a client that talks with SIA-based alarm systems."
HOMEPAGE="https://github.com/eavanvalkenburg/pysiaalarm/ https://pypi.org/project/pysiaalarm/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test typing"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/pycryptodome-3.9.7[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cases[${PYTHON_USEDEP}]
		dev-python/tox[${PYTHON_USEDEP}]
		dev-python/pydocstyle[${PYTHON_USEDEP}]
		dev-python/pylint[${PYTHON_USEDEP}]
	)
	typing? (
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/types-setuptools[${PYTHON_USEDEP}]
		dev-python/types-pytz[${PYTHON_USEDEP}]
	)
"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest