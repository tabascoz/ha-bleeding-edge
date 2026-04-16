# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="WebSocket support for HTTPX"
HOMEPAGE="https://github.com/frankie567/httpx-ws https://pypi.org/project/httpx-ws/"

SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    >=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
"

# Build dependencies for hatchling + regex commit plugin
BDEPEND="
    >=dev-python/hatchling-1.21.0[${PYTHON_USEDEP}]
    >=dev-python/hatch-regex-commit-0.0.4[${PYTHON_USEDEP}]
"

IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND+="
    test? (
        ${RDEPEND}
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/anyio[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest
