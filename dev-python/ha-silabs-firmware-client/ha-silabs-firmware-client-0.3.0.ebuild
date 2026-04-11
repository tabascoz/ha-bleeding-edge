# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Home Assistant client for firmwares released with silabs-firmware-builder"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    dev-python/aiohttp[${PYTHON_USEDEP}]
    dev-python/packaging[${PYTHON_USEDEP}]
    dev-python/yarl[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/tomli[${PYTHON_USEDEP}]
        dev-python/coverage[toml][${PYTHON_USEDEP}]
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-xdist[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/pytest-timeout[${PYTHON_USEDEP}]
        dev-python/aioresponses[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest