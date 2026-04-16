	# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Fitbit Web API"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-retry-2.9.1[${PYTHON_USEDEP}]
    <dev-python/aiohttp-retry-3[${PYTHON_USEDEP}]
    >=dev-python/aiohttp-3.13.2[${PYTHON_USEDEP}]
    >=dev-python/pydantic-2[${PYTHON_USEDEP}]
    >=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
    <dev-python/python-dateutil-3[${PYTHON_USEDEP}]
    >=dev-python/urllib3-2.1.0[${PYTHON_USEDEP}]
    <dev-python/urllib3-3[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest