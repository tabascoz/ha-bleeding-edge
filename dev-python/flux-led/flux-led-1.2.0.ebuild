# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python library to communicate with the flux_led smart bulbs"
HOMEPAGE="https://github.com/Danielhiversen/flux_led https://pypi.org/project/flux-led/"

LICENSE="LGPL-3+"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
    dev-python/webcolors[${PYTHON_USEDEP}]
    >=dev-python/async-timeout-3.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/pytest-runner-5.2[${PYTHON_USEDEP}]
    test? (
        >=dev-python/pytest-5.4.3[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        >=dev-python/pytest-cov-2.9.0[${PYTHON_USEDEP}]
        ~dev-python/ruff-0.11.2[${PYTHON_USEDEP}]
        >=dev-python/codecov-2.1.4[${PYTHON_USEDEP}]
        >=dev-python/pytest-raises-0.11[${PYTHON_USEDEP}]
    )
"

python_test() {
    py.test -v -v || die
}

distutils_enable_tests pytest