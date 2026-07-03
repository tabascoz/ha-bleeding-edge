# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
PYPI_PN="chefiq-ble"

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Passive BLE advertisement parser for Chef iQ wireless probes (CQ50/CQ60)"
HOMEPAGE="https://pypi.org/project/chefiq-ble/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/bluetooth-data-tools-1.19.0[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.10.0[${PYTHON_USEDEP}]
	>=dev-python/sensor-state-data-2.1.2[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/mypy-1.10[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-8.0[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.5[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest