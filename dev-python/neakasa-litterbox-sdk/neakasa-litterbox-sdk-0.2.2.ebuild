# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Async Python SDK for the Neakasa M1 self-cleaning cat litter box (unofficial)"
HOMEPAGE="
    https://github.com/roquerodrigo/neakasa-litterbox-sdk
    https://pypi.org/project/neakasa-litterbox-sdk/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    >=dev-python/aiohttp-3.13.5[${PYTHON_USEDEP}]
    >=dev-python/aiomqtt-2.5.1[${PYTHON_USEDEP}]
    >=dev-python/cryptography-44.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest