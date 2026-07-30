# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit pypi distutils-r1

DESCRIPTION="Bleak backend for SMLIGHT SLZB Bluetooth proxies"
HOMEPAGE="https://pypi.org/project/bleak-smlight/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/bluetooth-data-tools-1.18.0[${PYTHON_USEDEP}]
    >=dev-python/habluetooth-6.4.0[${PYTHON_USEDEP}]
    >=dev-python/pysmlight-0.5.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest