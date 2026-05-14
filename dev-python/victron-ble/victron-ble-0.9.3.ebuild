# Copyright 1999-2026
# Distributed under the terms of the Apache-2.0 license

EAPI=8
PYTHON_COMPAT=( python3_{12..14} )
# Upstream publishes sdist as "victron_ble-<ver>.tar.gz"
# PYPI_PN="${PN//-/_}"
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Parser for Victron BLE messages"
HOMEPAGE="https://github.com/rajlaud/victron-ble https://pypi.org/project/${PN}/"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64"
IUSE=""

# Runtime deps
# victron-ble provides the device parsers this package wraps
RDEPEND="
	dev-python/bleak[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/pycryptodome[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
"

# Nothing special to adjust
# distutils-r1 + pypi will set SRC_URI and S automatically
