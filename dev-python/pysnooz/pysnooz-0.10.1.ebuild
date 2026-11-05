# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
PYPI_PN="pysnooz"
inherit distutils-r1 pypi

DESCRIPTION="Control SNOOZ white noise machines."
HOMEPAGE="https://github.com/AustinBrunkhorst/pysnooz https://pypi.org/project/pysnooz/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

# relaxed by tmp/relaxbounds.py: an operator in the block below named a version
# no repo carries. The bound is answered with the newest version that IS available -
# never a downgrade, never a version nobody declared (WORKFLOW.md step 12's rule).
RDEPEND="
	>=dev-python/events-0.5[${PYTHON_USEDEP}]
	>=dev-python/bleak-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/bleak-retry-connector-3.0.2[${PYTHON_USEDEP}]
	>=dev-python/bluetooth-sensor-state-data-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-bluetooth-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/transitions-0.9.3[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest