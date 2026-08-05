# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Modern async Python client and CLI for Vizio SmartCast devices"
HOMEPAGE="https://pypi.org/project/vizaio/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cli dev discovery test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
    <dev-python/aiohttp-3.16[${PYTHON_USEDEP}]
    >=dev-python/platformdirs-4.0[${PYTHON_USEDEP}]
    dev-python/pyyaml[${PYTHON_USEDEP}]
    >=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    cli? (
        >=dev-python/rich-13.0[${PYTHON_USEDEP}]
        >=dev-python/tomlkit-0.13[${PYTHON_USEDEP}]
        >=dev-python/typer-0.12[${PYTHON_USEDEP}]
    )
    dev? (
        >=dev-python/aioresponses-0.7[${PYTHON_USEDEP}]
        >=dev-python/mypy-1.20[${PYTHON_USEDEP}]
        >=dev-python/pytest-asyncio-0.23[${PYTHON_USEDEP}]
        >=dev-python/pytest-cov-5.0[${PYTHON_USEDEP}]
        >=dev-python/pytest-9.0[${PYTHON_USEDEP}]
        >=dev-python/ruff-0.15[${PYTHON_USEDEP}]
    )
    discovery? (
        >=dev-python/zeroconf-0.131[${PYTHON_USEDEP}]
    )
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest

pkg_postinst() {
    if use cli; then
        elog "The vizaio CLI is now available. Run 'vizaio --help' for usage."
    fi
}