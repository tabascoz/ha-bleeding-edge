# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="An asynchronous, type-safe Python client library for the Google Health API."
HOMEPAGE="https://pypi.org/project/google-health-api/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test webhook"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.7.3[${PYTHON_USEDEP}]
    >=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
    dev-python/cryptography[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
    webhook? (
        >=dev-python/cryptography-43.0.0[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest
pkg_postinst() {
    if use webhook; then
        elog "The webhook extra requires cryptography>=43.0.0"
    fi
}