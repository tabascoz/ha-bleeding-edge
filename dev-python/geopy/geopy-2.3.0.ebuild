# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python Geocoding Toolbox"
HOMEPAGE="https://github.com/geopy/geopy https://pypi.org/project/geopy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/geographiclib-1.52[${PYTHON_USEDEP}]
	<dev-python/geographiclib-3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.17[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest