# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_wheel_url)"                                                                                                                                                                                        

DESCRIPTION="An API wrapper for Epic Games Store written in Python"
HOMEPAGE="https://github.com/SD4RK/epicstore_api https://pypi.org/project/epicstore-api/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND=">=dev-python/cloudscraper-1.2.71[${PYTHON_USEDEP}]"

distutils_enable_tests pytest