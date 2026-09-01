# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="module to get data from a Guntamatic heater e.g. BMK 20"
HOMEPAGE="https://github.com/JensTimmerman/guntamatic https://pypi.org/project/guntamatic/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"