# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="cChardet is high speed universal character encoding detector."
HOMEPAGE="https://github.com/faust-streaming/cChardet https://pypi.org/project/faust-cchardet/"

LICENSE="MPL-1.1 GPL-2.0-or-later LGPL-2.1-or-later"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

distutils_enable_tests pytest