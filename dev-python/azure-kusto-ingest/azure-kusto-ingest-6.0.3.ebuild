# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Kusto Ingest Client"
HOMEPAGE="https://github.com/Azure/azure-kusto-python https://pypi.org/project/azure-kusto-ingest/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="pandas test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

RDEPEND="
	dev-python/azure-kusto-data[${PYTHON_USEDEP}]
	=dev-python/azure-storage-blob-12.26.0[${PYTHON_USEDEP}]
	=dev-python/azure-storage-queue-12.13.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-9.1.2[${PYTHON_USEDEP}]
	pandas? ( >=dev-python/pandas-2.3.1[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

src_prepare() {
	sed -i -e '/namespace_packages/d' setup.py || die
	distutils-r1_src_prepare
}