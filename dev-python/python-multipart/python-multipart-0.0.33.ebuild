# Copyright 2022-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A streaming multipart parser for Python"
HOMEPAGE="
	https://github.com/Kludex/python-multipart/
	https://pypi.org/project/python-multipart/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

BDEPEND="
	test? (
		dev-python/pyyaml[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# do not install the backwards compatibility package
	# we're patching revdeps instead
	rm -r multipart || die
}