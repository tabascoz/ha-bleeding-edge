# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python API for communication with Synology DSM"
HOMEPAGE="https://github.com/mib1185/py-synologydsm-api https://pypi.org/project/py-synologydsm-api/"
SRC_URI="$(pypi_wheel_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/awesomeversion[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest