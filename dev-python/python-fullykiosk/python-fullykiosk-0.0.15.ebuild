# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Python wrapper for Fully Kiosk Browser REST API"
HOMEPAGE="https://github.com/cgarwood/python-fullykiosk https://pypi.org/project/python-fullykiosk/"
SRC_URI="https://files.pythonhosted.org/packages/59/85/b40028b526e01b03d8143cdc1a2ff04e53586199e8d151dca93fc5294db4/python_fullykiosk-0.0.15.tar.gz"

S="${WORKDIR}/python_fullykiosk-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
