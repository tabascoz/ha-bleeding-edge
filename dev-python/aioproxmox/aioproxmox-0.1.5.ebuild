# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Asynchronous Python library for Proxmox products"
HOMEPAGE="https://pypi.org/project/aioproxmox/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/aiohttp-3.14[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.22[${PYTHON_USEDEP}]
"