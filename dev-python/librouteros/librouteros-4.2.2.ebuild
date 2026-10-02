# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1

DESCRIPTION="Python implementation of MikroTik RouterOS API"
HOMEPAGE="
	https://pypi.org/project/librouteros/
	https://github.com/luqasz/librouteros/
"
# Tests are not shipped in the PyPI sdist.
SRC_URI="
	https://github.com/luqasz/${PN}/archive/refs/tags/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="GPL-2+"
SLOT="0"
KEYWORDS="~amd64"

DOCS=( CHANGELOG.rst README.rst )

EPYTEST_PLUGINS=( hypothesis pytest-asyncio )
distutils_enable_tests pytest
distutils_enable_sphinx docs --no-autodoc

python_test() {
	epytest tests/unit
}
