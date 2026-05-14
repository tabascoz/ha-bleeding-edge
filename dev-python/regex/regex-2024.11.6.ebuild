# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
# pypy isn't supported upstream because of its UTF8 representation for strings
# See https://github.com/mrabarnett/mrab-regex/issues/521#issuecomment-1936260187.
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Alternative regular expression module to replace re"
HOMEPAGE="
	https://github.com/mrabarnett/mrab-regex/
	https://pypi.org/project/regex/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="doc"

distutils_enable_tests pytest

python_install_all() {
	use doc && local HTML_DOCS=( docs/Features.html )
	local DOCS=( README.rst docs/*.rst )

	distutils-r1_python_install_all
}
