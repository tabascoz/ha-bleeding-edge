# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Async Python 3 client for WebDAV, based on aiowebdav and https://github.com/ezhov-evgeny/webdav-client-python-3"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiofiles-0.7.0[${PYTHON_USEDEP}]
    >=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
    >=dev-python/lxml-5.3.0[${PYTHON_USEDEP}]
    >=dev-python/python-dateutil-2.9.0_p0[${PYTHON_USEDEP}]
    >=dev-python/yarl-1.18.3[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest
