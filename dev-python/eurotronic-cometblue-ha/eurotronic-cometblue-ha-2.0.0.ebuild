# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
PYPI_PN="eurotronic-cometblue-ha"

DISTUTILS_USE_PEP517=pdm-backend
inherit distutils-r1 pypi

DESCRIPTION="Python client for Eurotronic GmbH BLE Comet (and rebranded) Radiator TRVs."
HOMEPAGE="https://pypi.org/project/eurotronic-cometblue-ha/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	dev-python/bleak[${PYTHON_USEDEP}]
	dev-python/bleak-retry-connector[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"