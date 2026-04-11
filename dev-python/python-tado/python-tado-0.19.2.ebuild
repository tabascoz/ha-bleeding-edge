# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="PyTado -- Pythonize your central heating"
HOMEPAGE="https://github.com/wmalgadey/PyTado https://pypi.org/project/python-tado/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/pytest-mock[${PYTHON_USEDEP}]
        dev-python/pytest-socket[${PYTHON_USEDEP}]
        dev-python/responses[${PYTHON_USEDEP}]
    )
"

src_prepare() {
	echo -e "requests" > requirements.txt
	eapply_user
}

distutils_enable_tests pytest