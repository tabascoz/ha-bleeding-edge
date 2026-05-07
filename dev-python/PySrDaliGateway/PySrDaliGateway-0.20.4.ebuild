# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

PYPI_PN="PySrDaliGateway"
DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="Python library for Sunricher DALI Gateway (EDA)"
HOMEPAGE="https://pypi.org/project/PySrDaliGateway/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/paho-mqtt-1.6.0[${PYTHON_USEDEP}]
    >=dev-python/psutil-6.0.0[${PYTHON_USEDEP}]
    >=dev-python/cryptography-40.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest