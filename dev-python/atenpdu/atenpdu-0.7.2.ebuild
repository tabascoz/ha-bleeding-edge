# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Interface for ATEN-PE PDUs"
HOMEPAGE="https://github.com/mtdcr/pductl https://pypi.org/project/atenpdu/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/async-timeout-4.0.3[${PYTHON_USEDEP}]
	<dev-python/async-timeout-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/pysnmp-7.1.21[${PYTHON_USEDEP}]
	<dev-python/pysnmp-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-46.0.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest