# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python library for iNELS mqtt protocol"
HOMEPAGE="https://pypi.org/project/elkoep-aio-mqtt/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=""
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        >=dev-python/pytest-8.2.0[${PYTHON_USEDEP}]
        >=dev-python/pytest-asyncio-1.2.0[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest
