# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="A Python wrapper for the Discord API forked from discord.py"
HOMEPAGE="https://github.com/nextcord/nextcord https://pypi.org/project/nextcord/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test voice speed"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
    dev-python/aiohttp[>=3.8.0,<4.0.0][${PYTHON_USEDEP}]
    dev-python/typing-extensions[>=4.2.0,<5.0.0][${PYTHON_USEDEP}]
    dev-python/audioop-lts[>=0.2.1,<0.3.0][${PYTHON_USEDEP}]
    voice? ( dev-python/pynacl[>=1.3.0,<1.5][${PYTHON_USEDEP}] )
    speed? (
        dev-python/brotli[${PYTHON_USEDEP}]
        dev-python/aiodns[>1.1][${PYTHON_USEDEP}]
        dev-python/brotlicffi[${PYTHON_USEDEP}]
        dev-python/orjson[>=3.5.4][${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest