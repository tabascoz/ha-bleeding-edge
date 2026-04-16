# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="AIO package for the Honeywell Lyric Platform."
HOMEPAGE="https://github.com/timmo001/aiolyric https://pypi.org/project/aiolyric/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/aiohttp-3.7.3[${PYTHON_USEDEP}]
	>=dev-python/incremental-22.10.0[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

#src_prepare() {
#	eapply ${FILESDIR}/aiolyric-2.0.2-setup-py.patch
#	default
#}
python_prepare_all() {


    sed -i \
        -e '/requirements_setup/d' \
        -e '/requirements =/d' \
        -e '/with open("requirements_setup.txt"/,/^$/d' \
        -e '/with open("requirements.txt"/,/^$/d' \
        -e 's/install_requires=requirements,/install_requires=[ "aiohttp", "packaging", ],/' \
        setup.py || die

    sed -i "s/version=\"2.0.2\"/version=\"${PV}\"/" setup.py || die
    distutils-r1_python_prepare_all
    }
distutils_enable_tests pytest
