# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Async library that applies color themes to LIFX lights"
HOMEPAGE="https://github.com/Djelibeybi/aiolifx-themes https://pypi.org/project/aiolifx-themes/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="docs test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
    >=dev-python/aiolifx-1.1.0[${PYTHON_USEDEP}]
    <dev-python/aiolifx-2.0.0[${PYTHON_USEDEP}]
    docs? (
        >=dev-python/sphinx-8.0.0[${PYTHON_USEDEP}]
        <dev-python/sphinx-9.0.0[${PYTHON_USEDEP}]
        >=dev-python/myst-parser-4.0.0[${PYTHON_USEDEP}]
        <dev-python/myst-parser-5.0.0[${PYTHON_USEDEP}]
        >=dev-python/sphinx-rtd-theme-3.0.0[${PYTHON_USEDEP}]
        <dev-python/sphinx-rtd-theme-4.0.0[${PYTHON_USEDEP}]
    )
"
BDEPEND="
    test? (
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest