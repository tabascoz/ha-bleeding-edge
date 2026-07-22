# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="ReactiveX (Rx) for Python"
HOMEPAGE="http://reactivex.io https://github.com/ReactiveX/RxPY https://pypi.org/project/reactivex/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
    >=dev-python/typing-extensions-4.15.0[${PYTHON_USEDEP}]
    <dev-python/typing-extensions-5.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest