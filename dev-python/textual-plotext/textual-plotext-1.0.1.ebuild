# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit pypi distutils-r1

DESCRIPTION="A Textual widget wrapper for the Plotext plotting library"
HOMEPAGE="https://github.com/Textualize/textual-plotext"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/plotext-5.2.8[${PYTHON_USEDEP}]
	<dev-python/plotext-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/textual-0.86.2[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/hatchling-1.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest