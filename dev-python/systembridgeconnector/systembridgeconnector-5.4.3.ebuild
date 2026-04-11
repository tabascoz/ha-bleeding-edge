# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="System Bridge Connector"
HOMEPAGE="https://github.com/timmo001/system-bridge-connector https://pypi.org/project/systembridgeconnector/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/aiohttp-3.12.15[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.0[${PYTHON_USEDEP}]"

src_prepare() {
	echo -e "aiohttp>=3.12.15\npackaging>=24.0\n" > requirements.txt
	echo -e "aiohttp>=3.12.15\npackaging>=24.0\n" > requirements_setup.txt
	eapply_user
}

distutils_enable_tests pytest