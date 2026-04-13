# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="This is a Kia UVO and Hyundai Bluelink written in python for Homeassistant"
HOMEPAGE="https://github.com/fuatakgun/hyundai_kia_connect_api https://pypi.org/project/hyundai-kia-connect-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="google test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/beautifulsoup4-4.10.0[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	>=dev-python/certifi-2024.6.2[${PYTHON_USEDEP}]
	>=dev-python/tzdata-2025.2[${PYTHON_USEDEP}]
	google? ( >=dev-python/geopy-2.2.0[${PYTHON_USEDEP}] )
"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
