# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="Module to handle communication with ToGrill compatible temperature probes."
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cli"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/bleak-retry-connector-4.0.0[${PYTHON_USEDEP}]
    >=dev-python/bleak-1.0.1[${PYTHON_USEDEP}]
    cli? (
        >=dev-python/anyio-4.9.0[${PYTHON_USEDEP}]
        >=dev-python/asyncclick-8.1.8[${PYTHON_USEDEP}]
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