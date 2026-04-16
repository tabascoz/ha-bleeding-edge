# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="Pilot your Ezviz cameras"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="
    dev-python/requests[${PYTHON_USEDEP}]
    dev-python/pandas[${PYTHON_USEDEP}]
    dev-python/paho-mqtt[${PYTHON_USEDEP}]
    dev-python/xmltodict[${PYTHON_USEDEP}]
    dev-python/pycryptodome[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"