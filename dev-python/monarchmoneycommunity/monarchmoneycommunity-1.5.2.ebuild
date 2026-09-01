# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python library for accessing Monarch Money data (community fork)"
HOMEPAGE="https://github.com/bradleyseanf/monarchmoneycommunity"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"

RDEPEND="
	>=dev-python/aiohttp-3.14.3[${PYTHON_USEDEP}]
	=dev-python/gql-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/oathtool-2.4.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

RESTRICT="!test? ( test )"

distutils_enable_tests pytest