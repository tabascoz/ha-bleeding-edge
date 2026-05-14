# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )
inherit distutils-r1

DESCRIPTION="A comprehensive HTTP client library"
HOMEPAGE="
	https://pypi.org/project/httplib2/
	https://github.com/httplib2/httplib2/
"
SRC_URI="
	https://github.com/httplib2/httplib2/archive/v${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	app-misc/ca-certificates
	dev-python/pyparsing[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-libs/openssl
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/six[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

PATCHES=( "${FILESDIR}/${PN}-0.12.1-use-system-cacerts.patch" )

src_prepare() {
	sed -i -e '/--cov/d' setup.cfg || die
	# cryptography dep is entirely optional, and has a good fallback
	sed -i -e 's:from cryptography.*:pass:' tests/__init__.py || die
	distutils-r1_src_prepare
}
