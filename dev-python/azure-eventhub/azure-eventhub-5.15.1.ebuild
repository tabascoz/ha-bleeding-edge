# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Microsoft Azure Event Hubs Client Library for Python"
HOMEPAGE="https://pypi.org/project/${PN}/"
#SRC_URI="$(pypi_sdist_url --no-normalize)"
#SRC_URI="$(pypi_sdist_url"
#SRC_URI="https://files.pythonhosted.org/packages/source/a/azure-eventhub/azure-eventhub-5.11.1.tar.gz"
#S="${WORKDIR}/azure_eventhub-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="
    >=dev-python/azure-core-1.14.0[${PYTHON_USEDEP}]
    <dev-python/azure-core-2.0.0[${PYTHON_USEDEP}]
    >=dev-python/typing-extensions-4.0.1[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"