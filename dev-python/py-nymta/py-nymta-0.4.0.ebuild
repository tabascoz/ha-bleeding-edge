# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python library for accessing MTA (Metropolitan Transportation Authority) real-time transit data for NYC"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    =dev-python/gtfs-realtime-bindings-2.0.0[${PYTHON_USEDEP}]
    >=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
    >=dev-python/aiofiles-23.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest