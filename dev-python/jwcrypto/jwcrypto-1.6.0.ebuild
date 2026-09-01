# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Implementation of JOSE Web standards"
HOMEPAGE="https://github.com/latchset/jwcrypto/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/cryptography-49.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.5.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest

src_install() {
	distutils-r1_src_install
	rm -r "${ED}/usr/share/doc/jwcrypto" || die
}