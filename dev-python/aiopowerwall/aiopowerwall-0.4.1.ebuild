# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Async Tesla Powerwall 3 client over the TEDAPI v1r RSA-signed LAN protocol."
HOMEPAGE="https://pypi.org/project/aiopowerwall/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
    >=dev-python/cryptography-41[${PYTHON_USEDEP}]
    >=dev-python/protobuf-4.25[${PYTHON_USEDEP}]
    >=dev-python/tesla-protocol-1.4.0[${PYTHON_USEDEP}]
    <dev-python/tesla-protocol-4[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest
pkg_postinst() {
    elog "This package is required by Home Assistant's teslemetry component."
}