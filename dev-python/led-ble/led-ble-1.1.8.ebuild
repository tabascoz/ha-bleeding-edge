# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Control a wide range of LED BLE devices"
HOMEPAGE="https://github.com/bluetooth-devices/led-ble https://pypi.org/project/led-ble/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="docs test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/bleak-0.22.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/flux-led-0.28.32[${PYTHON_USEDEP}]
	docs? (
		>=dev-python/sphinx-5[${PYTHON_USEDEP}]
		<dev-python/sphinx-8[${PYTHON_USEDEP}]
		>=dev-python/myst-parser-0.18[${PYTHON_USEDEP}]
		<dev-python/myst-parser-3.1[${PYTHON_USEDEP}]
		>=dev-python/sphinx-rtd-theme-1[${PYTHON_USEDEP}]
		<dev-python/sphinx-rtd-theme-4[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest