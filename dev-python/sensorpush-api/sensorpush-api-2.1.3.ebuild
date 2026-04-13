# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="SensorPush Public API"
HOMEPAGE="https://pypi.org/project/sensorpush-api/"

LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/python-dateutil-2.5.3[${PYTHON_USEDEP}]
    >=dev-python/urllib3-1.25.3[${PYTHON_USEDEP}]
    <dev-python/urllib3-3.0.0[${PYTHON_USEDEP}]
    >=dev-python/pydantic-1.10.5[${PYTHON_USEDEP}]
    >=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        >=dev-python/pytest-7.1.3[${PYTHON_USEDEP}]
        <dev-python/pytest-8.0.0[${PYTHON_USEDEP}]
        dev-python/pytest-cov-2.8.1[${PYTHON_USEDEP}]
        >=dev-python/pytest-randomly-3.12.0[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest