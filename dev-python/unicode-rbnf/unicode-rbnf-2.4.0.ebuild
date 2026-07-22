# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{8..14} )

inherit distutils-r1 pypi

DESCRIPTION="Rule-based number formatting using Unicode CLDR data"
HOMEPAGE="
	https://github.com/rhasspy/unicode-rbnf
	https://pypi.org/project/unicode-rbnf/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
