# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

PYPI_PN="auth0-python"
DISTUTILS_USE_PEP517=poetry
inherit pypi distutils-r1

DESCRIPTION="Auth0 Python SDK - Management and Authentication APIs"
HOMEPAGE="https://pypi.org/project/auth0-python/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiohttp-3.11.18[${PYTHON_USEDEP}]
	>=dev-python/cryptography-44.0.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.21.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.9.2[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.3.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest