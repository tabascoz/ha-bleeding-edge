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
\tdev-python/requests[${PYTHON_USEDEP}]
\tdev-python/pandas[${PYTHON_USEDEP}]
\tdev-python/paho-mqtt[${PYTHON_USEDEP}]
\tdev-python/xmltodict[${PYTHON_USEDEP}]
\tdev-python/pycryptodome[${PYTHON_USEDEP}]
"
BDEPEND="
\t>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"