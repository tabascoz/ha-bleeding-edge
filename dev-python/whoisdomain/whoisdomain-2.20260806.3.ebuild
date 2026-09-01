# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Python package for retrieving WHOIS information of domains."
HOMEPAGE="https://pypi.org/project/whoisdomain/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/tld-0.13.2[${PYTHON_USEDEP}]
	>=dev-python/whodap-0.1.16[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest