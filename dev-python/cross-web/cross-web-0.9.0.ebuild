# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A library for working with web frameworks"
HOMEPAGE="
	https://github.com/usecross/cross-web/
	https://pypi.org/project/cross-web/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	>=dev-python/typing-extensions-4.14.0[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/django[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/flask[${PYTHON_USEDEP}]
		dev-python/quart[${PYTHON_USEDEP}]
		dev-python/starlette[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
	)
"

EPYTEST_IGNORE=(
	# frameworks not packaged in ::gentoo
	tests/request/test_chalice.py
	tests/request/test_litestar_extended.py
	tests/request/test_sanic.py
)
EPYTEST_DESELECT=(
	# sanic is not packaged in ::gentoo
	'tests/testing/clients/test_http_clients.py::test_request_adapter_json[http_client_config8]'
	'tests/testing/clients/test_http_clients.py::test_request_adapter_form_data[http_client_config8]'
)
EPYTEST_PLUGINS=( pytest-asyncio pytest-django )
distutils_enable_tests pytest
