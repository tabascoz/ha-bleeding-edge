# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A package for talking to vlc over its telnet interface using asyncio."
HOMEPAGE="https://github.com/MartinHjelmare/aiovlc https://pypi.org/project/aiovlc/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="cli test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
    cli? (
        >=dev-python/typer-0.15[${PYTHON_USEDEP}]
        <dev-python/typer-1[${PYTHON_USEDEP}]
    )
"
BDEPEND="
    test? (
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest