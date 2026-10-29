# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Local bluetooth le control for exicom spin ev chargers"
HOMEPAGE="https://pypi.org/project/spinev-ble/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="bleak"

RDEPEND="
	bleak? (
		>=dev-python/bleak-0.22.0[${PYTHON_USEDEP}]
		>=dev-python/bleak-retry-connector-4.0.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"