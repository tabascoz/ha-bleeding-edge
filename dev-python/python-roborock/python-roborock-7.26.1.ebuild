# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi
DESCRIPTION="A package to control Roborock vacuums."
HOMEPAGE="https://github.com/humbertogontijo/python-roborock https://pypi.org/project/python-roborock/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

# Upstream caps pycryptodome <4.0.0 (a tested-with bound). Both hosts run the ::gentoo
# 4.6.0 and step 12 allows zero downgrades, so the cap is dropped and the floor kept:
# a deliberate, recorded deviation from upstream metadata. Measured 2026-11-26,
# 2026.12.0_beta0 (the overlay's own pycryptodome-3.24.1 would have stepped both back).
RDEPEND="
	>=dev-python/aiohttp-3.8.2[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4[${PYTHON_USEDEP}]
	>=dev-python/aiomqtt-2.5.0[${PYTHON_USEDEP}]
	<dev-python/aiomqtt-3[${PYTHON_USEDEP}]
	>=dev-python/construct-2.10.57[${PYTHON_USEDEP}]
	<dev-python/construct-3[${PYTHON_USEDEP}]
	>=dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}]
	<dev-python/paho-mqtt-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-6.31.1[${PYTHON_USEDEP}]
	<dev-python/protobuf-8[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.18.0[${PYTHON_USEDEP}]
	>=dev-python/pyrate-limiter-4.0.0[${PYTHON_USEDEP}]
	<dev-python/pyrate-limiter-5[${PYTHON_USEDEP}]
	dev-python/vacuum-map-parser-roborock[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest