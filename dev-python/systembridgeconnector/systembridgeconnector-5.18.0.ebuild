# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="System Bridge Connector"
HOMEPAGE="https://github.com/timmo001/system-bridge-connector https://pypi.org/project/systembridgeconnector/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/aiohttp-3.14.4[${PYTHON_USEDEP}] \
	>=dev-python/packaging-26.3[${PYTHON_USEDEP}]"

src_prepare() {
	echo -e "aiohttp>=3.14.4
packaging>=26.3
" > requirements.txt
	echo -e "aiohttp>=3.14.4
packaging>=26.3
" > requirements_setup.txt
	eapply_user
}

distutils_enable_tests pytest