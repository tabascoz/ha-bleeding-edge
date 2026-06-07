# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Python package for the Honeywell Lyric Platform"
HOMEPAGE="https://github.com/timmo001/aiolyric https://pypi.org/project/aiolyric/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.13.5[${PYTHON_USEDEP}]
	>=dev-python/packaging-26.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"


python_prepare_all() {
	sed -i \
		-e '/requirements_setup/d' \
		-e '/requirements =/d' \
		-e '/with open("requirements_setup.txt"/,/^$/d' \
		-e '/with open("requirements.txt"/,/^$/d' \
		-e 's/install_requires=requirements,/install_requires=[ "aiohttp", "packaging" ],/' \
		setup.py || die

	sed -i "s/version=\"2.0.2\"/version=\"${PV}\"/" setup.py || die
	distutils-r1_python_prepare_all
}
distutils_enable_tests pytest
