# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
PYPI_PN="python-aidot"

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="aidot control wifi lights"
HOMEPAGE="https://github.com/Aidot-Development-Team/python-aidot"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/aiohttp[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"