# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

PYPI_PN="sockjs"

DESCRIPTION="SockJS server implementation for aiohttp"
HOMEPAGE="https://pypi.org/project/sockjs/ https://github.com/aio-libs/sockjs"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    >=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
"

BDEPEND="
    ${RDEPEND}
"