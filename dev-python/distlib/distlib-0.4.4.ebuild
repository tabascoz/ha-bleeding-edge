# Copyright 2021-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Low-level components of distutils2/packaging"
HOMEPAGE="
	https://pypi.org/project/distlib/
	https://github.com/pypa/distlib/
"

LICENSE="PSF-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

# pypiserver is called as external executable
BDEPEND="
	test? (
		dev-python/pypiserver
	)
"

python_test() {
	local -x SKIP_ONLINE=1
	local -x PYTHONHASHSEED=0

	# disable system-site-packages -- distlib has no deps, and is very
	# fragile to packages actually installed on the system
	sed -i -e '/system-site-packages/s:true:false:' \
		"${BUILD_DIR}/install${EPREFIX}/usr/pyvenv.cfg" || die

	"${EPYTHON}" tests/test_all.py -v -x ||
		die "Tests failed with ${EPYTHON}"
}