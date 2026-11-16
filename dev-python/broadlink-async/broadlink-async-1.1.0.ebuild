# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python API for controlling Broadlink devices"
HOMEPAGE="https://pypi.org/project/broadlink-async/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/cryptography-43[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-8[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest