# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Extensible memoizing collections and decorators"
HOMEPAGE="
	https://github.com/tkem/cachetools/
	https://pypi.org/project/cachetools/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

python_test() {
	local -x THREADING_TESTS=1
	epytest
}