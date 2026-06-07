# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=flit

inherit distutils-r1 pypi

DESCRIPTION="Internationalized Domain Names in Applications (IDNA)"
HOMEPAGE="https://pypi.org/project/idna/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		>=dev-python/pytest-8.3.2[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest