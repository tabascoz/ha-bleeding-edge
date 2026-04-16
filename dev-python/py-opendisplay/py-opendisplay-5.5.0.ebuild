# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python library for OpenDisplay BLE e-paper displays"
HOMEPAGE="https://pypi.org/project/py-opendisplay/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/bleak-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.5.0[${PYTHON_USEDEP}]
	=dev-python/epaper-dithering-0.6.4[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.24.0[${PYTHON_USEDEP}]
	>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-1.3.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-xdist-3.8.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest