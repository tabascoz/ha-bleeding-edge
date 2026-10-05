# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit pypi distutils-r1

DESCRIPTION="Asynchronous Python client for SolarEdge inverters over Modbus."
HOMEPAGE="https://pypi.org/project/solaredged/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cli test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/modbus-connection-4.8.1[${PYTHON_USEDEP}]
    cli? (
        >=dev-python/rich-14.0.0[${PYTHON_USEDEP}]
        >=dev-python/typer-0.15.1[${PYTHON_USEDEP}]
        >=dev-python/textual-8.0.0[${PYTHON_USEDEP}]
        <dev-python/textual-9.0.0[${PYTHON_USEDEP}]
        >=dev-python/textual-plotext-1.0.0[${PYTHON_USEDEP}]
        <dev-python/textual-plotext-2.0.0[${PYTHON_USEDEP}]
    )
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest

pkg_postinst() {
    if use cli; then
        einfo "The 'cli' optional dependency is enabled."
    fi
}