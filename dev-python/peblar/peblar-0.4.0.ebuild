# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Asynchronous Python client for Peblar EV chargers"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cli test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
    >=dev-python/awesomeversion-22.8.0[${PYTHON_USEDEP}]
    >=dev-python/backoff-2.2.1[${PYTHON_USEDEP}]
    >=dev-python/mashumaro-3.10[${PYTHON_USEDEP}]
    >=dev-python/orjson-3.9.8[${PYTHON_USEDEP}]
    >=dev-python/yarl-1.6.0[${PYTHON_USEDEP}]
    cli? (
        >=dev-python/typer-0.15.1[${PYTHON_USEDEP}]
        >=dev-python/zeroconf-0.126.0[${PYTHON_USEDEP}]
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