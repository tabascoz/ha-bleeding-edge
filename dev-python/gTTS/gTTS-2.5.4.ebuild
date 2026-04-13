# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="gTTS (Google Text-to-Speech), a Python library and CLI tool to interface with Google Translate text-to-speech API"
HOMEPAGE="https://github.com/pndurette/gTTS https://pypi.org/project/gTTS/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
    dev-python/six[${PYTHON_USEDEP}]
    >=dev-python/requests-2.27[${PYTHON_USEDEP}]
    <dev-python/requests-3[${PYTHON_USEDEP}]
    >=dev-python/click-7.1[${PYTHON_USEDEP}]
    <dev-python/click-8.2[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        >=dev-python/pytest-7.1.3[${PYTHON_USEDEP}]
        <dev-python/pytest-8.4.0[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/testfixtures[${PYTHON_USEDEP}]
    )
"

python_test() {
    py.test -v -v || die
}

distutils_enable_tests pytest