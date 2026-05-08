# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=maturin
inherit pypi distutils-r1

DESCRIPTION="A command line utility to check for unused, missing and transitive dependencies in a Python project."
HOMEPAGE="https://pypi.org/project/deptry/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/click-8.0.0[${PYTHON_USEDEP}]
	<dev-python/click-9[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/requirements-parser-0.11.0[${PYTHON_USEDEP}]
	<dev-python/requirements-parser-1[${PYTHON_USEDEP}]
	>=dev-python/tomli-2.0.1[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/meson-python-0.13.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest