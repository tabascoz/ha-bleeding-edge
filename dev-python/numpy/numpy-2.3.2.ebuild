# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=meson-python

inherit distutils-r1 pypi

DESCRIPTION="Fundamental package for array computing in Python"
HOMEPAGE="https://pypi.org/project/numpy/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	>=dev-python/meson-python-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/cython-3.0.0[${PYTHON_USEDEP}]
	virtual/pkgconfig
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/hypothesis[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest