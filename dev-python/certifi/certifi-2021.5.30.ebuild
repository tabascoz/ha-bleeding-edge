# Copyright 2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Python package for providing Mozilla's CA Bundle."
HOMEPAGE="https://certifiio.readthedocs.io/en/latest/ https://pypi.org/project/certifi/"

LICENSE="MPL-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND=""
BDEPEND="
	>=dev-python/setuptools-38.3.0[${PYTHON_USEDEP}]
"