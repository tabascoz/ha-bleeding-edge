# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Async Python client library for OPNsense"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="docs test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.12.0[${PYTHON_USEDEP}]
    >=dev-python/awesomeversion-25.8.0[${PYTHON_USEDEP}]
    >=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
    docs? (
        >=dev-python/sphinx-8[${PYTHON_USEDEP}]
        <dev-python/sphinx-9[${PYTHON_USEDEP}]
        >=dev-python/sphinx-rtd-theme-3[${PYTHON_USEDEP}]
        <dev-python/sphinx-rtd-theme-4[${PYTHON_USEDEP}]
        >=dev-python/myst-parser-4[${PYTHON_USEDEP}]
        <dev-python/myst-parser-6[${PYTHON_USEDEP}]
    )
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest