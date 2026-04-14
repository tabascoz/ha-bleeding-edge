# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python interface to the Met Office's Datapoint API"
HOMEPAGE="https://github.com/ejep/datapoint-python https://pypi.org/project/datapoint/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/appdirs-1[${PYTHON_USEDEP}]
	<dev-python/appdirs-2[${PYTHON_USEDEP}]
	>=dev-python/geojson-3.0.0[${PYTHON_USEDEP}]
	<dev-python/geojson-4[${PYTHON_USEDEP}]
	>=dev-python/requests-2.20.0[${PYTHON_USEDEP}]
	<dev-python/requests-3[${PYTHON_USEDEP}]
"
BDEPEND=""

distutils_enable_tests pytest