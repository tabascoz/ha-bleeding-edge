# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

DESCRIPTION="A client for OMIE - Spain and Portugal electricity market data"
HOMEPAGE="https://github.com/luuuis/pyomie https://pypi.org/project/pyomie/"
SRC_URI="mirror://pypi/${P:0:1}/${PN}/${P}.tar.gz"
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/typer[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
