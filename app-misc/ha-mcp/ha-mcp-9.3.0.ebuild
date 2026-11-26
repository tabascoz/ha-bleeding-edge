# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
# ha-mcp requires >=3.14,<3.15 (matches HA core-2026.7+ interpreter).
PYTHON_COMPAT=( python3_14 )

inherit distutils-r1 pypi

DESCRIPTION="Configure and automate Home Assistant with AI assistants (MCP server)"
HOMEPAGE="
	https://github.com/homeassistant-ai/ha-mcp
	https://pypi.org/project/ha-mcp/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

# Upstream test suite drives a real Home Assistant container
# (docker/testcontainers) and Core's fixtures -> not runnable here.
RESTRICT="test"

# Mirrors [project].dependencies of ha-mcp 9.3.0, expressed as Portage atoms.
#
# Deliberately NOT declared:
#   * dev-python/socksio -- upstream asks for httpx[socks]; the extra only
#     pulls SOCKS proxy support, which no ha-mcp code path uses (verified by
#     grepping the sdist).  socksio-1.0.0.ebuild pins <dev-python/flit-core-4
#     and would DOWNGRADE the installed flit-core-4.2.0, so it is dropped.
#   * dev-python/{mcp,fastmcp} -- vendored inside the wheel (ha_mcp/_vendor).
#   * dev-python/websockets -- ha-mcp ships a private vendored copy on purpose
#     (upstream comment in pyproject.toml) so that it never pins the copy
#     Home Assistant's integrations fight over.
RDEPEND="
	>=dev-python/anyio-4.10[${PYTHON_USEDEP}]
	>=dev-python/authlib-1.9.5[${PYTHON_USEDEP}]
	>=dev-python/certifi-2026.10.19[${PYTHON_USEDEP}]
	>=dev-python/cyclopts-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/exceptiongroup-1.2.2[${PYTHON_USEDEP}]
	>=dev-python/griffelib-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1:=[${PYTHON_USEDEP}]
	<dev-python/httpx-0.29
	>=dev-python/httpx2-2.10.0[${PYTHON_USEDEP}]
	>=dev-python/joserfc-1.7.6[${PYTHON_USEDEP}]
	>=dev-python/jsonref-1.1.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-4.20.0[${PYTHON_USEDEP}]
	>=dev-python/jsonschema-path-0.3.4[${PYTHON_USEDEP}]
	>=dev-python/mcp-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/openapi-pydantic-0.6.0[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.28.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.0[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/psutil-7.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.13.4[${PYTHON_USEDEP}]
	<dev-python/pydantic-3
	=dev-python/pydantic-monty-0.0.18[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.0.0[${PYTHON_USEDEP}]
	~dev-python/py-key-value-aio-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.10.1[${PYTHON_USEDEP}]
	>=dev-python/pyperclip-1.9.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1.2.4[${PYTHON_USEDEP}]
	<dev-python/python-dotenv-2
	>=dev-python/python-multipart-0.0.26[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	<dev-python/pyyaml-7.0
	>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
	>=dev-python/socksio-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/sse-starlette-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/starlette-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/truststore-0.10.4[${PYTHON_USEDEP}]
	<dev-python/truststore-0.11
	>=dev-python/typing-extensions-4.13.0[${PYTHON_USEDEP}]
	>=dev-python/typing-inspection-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/tzdata-2024.1[${PYTHON_USEDEP}]
	>=dev-python/uncalled-for-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/ulid-transform-2.2.9[${PYTHON_USEDEP}]
	<dev-python/ulid-transform-3[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.35[${PYTHON_USEDEP}]
	>=dev-python/watchfiles-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-48.0.0[${PYTHON_USEDEP}]
	<dev-python/cryptography-51
"
DEPEND="${RDEPEND}"
BDEPEND="
	>=dev-python/uv-build-0.12.17[${PYTHON_USEDEP}]
	<dev-python/uv-build-0.14
"
