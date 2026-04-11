# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python API for interacting with the Stiebel Eltron ISG web gateway via Modbus."
HOMEPAGE="https://pypi.org/project/pystiebeleltron/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/pymodbus-3.10.0[${PYTHON_USEDEP}] <dev-python/pymodbus-4[${PYTHON_USEDEP}]"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	sed -i "s/packages=find_packages()/packages=find_packages(exclude=['test'])/g" -i setup.py || die
	eapply_user
}

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest