# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

MY_P=python-json-patch-${PV}
DESCRIPTION="Apply JSON-Patches (RFC 6902)"
HOMEPAGE="
	https://github.com/stefankoegl/python-json-patch/
	https://pypi.org/project/jsonpatch/
"
SRC_URI="
	https://github.com/stefankoegl/python-json-patch/archive/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/jsonpointer-3.8[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		${RDEPEND}
		dev-python/hypothesis[${PYTHON_USEDEP}]
		dev-python/simplejson[${PYTHON_USEDEP}]
	)
"

python_test() {
	"${EPYTHON}" tests.py || die "Tests of tests.py fail with ${EPYTHON}"
	"${EPYTHON}" ext_tests.py || die "Tests of ext_tests.py fail with ${EPYTHON}"
	"${EPYTHON}" property_tests.py || die "Tests of property_tests.py fail with ${EPYTHON}"
}