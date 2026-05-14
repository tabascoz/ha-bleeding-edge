# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit pypi distutils-r1

DESCRIPTION="use icdiff for better error messages in pytest assertions"
HOMEPAGE="https://github.com/hjwp/pytest-icdiff"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/pytest[${PYTHON_USEDEP}]
	app-misc/icdiff[${PYTHON_USEDEP}]
	dev-python/pprintpp[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
