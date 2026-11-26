# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python client for Tile trackers over Bluetooth."
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-0.22.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.5.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/poetry-core[${PYTHON_USEDEP}]
"