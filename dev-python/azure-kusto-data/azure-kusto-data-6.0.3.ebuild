# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Kusto Data Client"
HOMEPAGE="https://github.com/Azure/azure-kusto-python https://pypi.org/project/azure-kusto-data/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="aio pandas test"
RESTRICT="!test? ( test )"
REQUIRED_USE="pandas? ( aio )"

RDEPEND=">=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.4[${PYTHON_USEDEP}]
	>=dev-python/azure-identity-1.24.0[${PYTHON_USEDEP}]
	<dev-python/azure-identity-2[${PYTHON_USEDEP}]
	>=dev-python/msal-1.34.0b1[${PYTHON_USEDEP}]
	<dev-python/msal-2[${PYTHON_USEDEP}]
	>=dev-python/ijson-3.4.0[${PYTHON_USEDEP}]
	<dev-python/ijson-3.5.0[${PYTHON_USEDEP}]
	>=dev-python/azure-core-1.35.0[${PYTHON_USEDEP}]
	<dev-python/azure-core-2[${PYTHON_USEDEP}]
	aio? ( >=dev-python/aiohttp-3.12.15[${PYTHON_USEDEP}] >=dev-python/asgiref-3.9.1[${PYTHON_USEDEP}] )
	pandas? ( >=dev-python/pandas-2.3.1[${PYTHON_USEDEP}] )"

distutils_enable_tests pytest