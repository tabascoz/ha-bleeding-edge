# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Model Context Protocol SDK"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cli rich ws test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/anyio-4.5[${PYTHON_USEDEP}]
    >=dev-python/httpx-sse-0.4[${PYTHON_USEDEP}]
    >=dev-python/httpx-0.27.1[${PYTHON_USEDEP}]
    >=dev-python/jsonschema-4.20.0[${PYTHON_USEDEP}]
    >=dev-python/pydantic-settings-2.5.2[${PYTHON_USEDEP}]
    >=dev-python/pydantic-2.11.0[${PYTHON_USEDEP}]
    <dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]
    >=dev-python/pyjwt-2.10.1[crypto,${PYTHON_USEDEP}]
    >=dev-python/python-multipart-0.0.9[${PYTHON_USEDEP}]
    >=dev-python/sse-starlette-1.6.1[${PYTHON_USEDEP}]
    >=dev-python/starlette-0.27[${PYTHON_USEDEP}]
    >=dev-python/typing-extensions-4.9.0[${PYTHON_USEDEP}]
    >=dev-python/typing-inspection-0.4.1[${PYTHON_USEDEP}]
    >=dev-python/uvicorn-0.31.1[${PYTHON_USEDEP}]
    cli? (
        >=dev-python/python-dotenv-1.0.0[${PYTHON_USEDEP}]
        >=dev-python/typer-0.16.0[${PYTHON_USEDEP}]
    )
    rich? ( >=dev-python/rich-13.9.4[${PYTHON_USEDEP}] )
    ws? ( >=dev-python/websockets-15.0.1[${PYTHON_USEDEP}] )
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest