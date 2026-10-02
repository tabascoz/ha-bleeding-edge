# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Read and control KACO solar inverters over SunSpec Modbus."
HOMEPAGE="https://pypi.org/project/kaco-modbus/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cli test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/modbus-connection-4.8.1[${PYTHON_USEDEP}]
    <dev-python/modbus-connection-5[${PYTHON_USEDEP}]
    >=dev-python/rich-13.7[${PYTHON_USEDEP}]
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
    elog "This package is required by Home Assistant component kaco_modbus."
}