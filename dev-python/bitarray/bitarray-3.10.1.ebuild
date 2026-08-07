# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1
inherit pypi distutils-r1

DESCRIPTION="Efficient arrays of booleans -- C extension"
HOMEPAGE="
	https://github.com/ilanschnell/bitarray/
	https://pypi.org/project/bitarray/
"

LICENSE="PSF-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	"${EPYTHON}" bitarray/test_bitarray.py -v || die "Tests fail with ${EPYTHON}"
}