# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Async Python client for Russound RIO and RNET multi-zone audio systems."
HOMEPAGE="https://github.com/noahhusby/aiorussound https://pypi.org/project/aiorussound/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/mashumaro-3.17[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.11.8[${PYTHON_USEDEP}]
	>=dev-python/serialx-1.2.2[${PYTHON_USEDEP}]
"

BDEPEND="
	${RDEPEND}
	test? (
		dev-python/pytest
	)
"

distutils_enable_tests pytest
