# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="An async GeoJSON client library"
HOMEPAGE="https://github.com/exxamalte/python-aio-geojson-client
    https://pypi.org/project/aio-geojson-client/"

SRC_URI="$(pypi_sdist_url)"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    dev-python/aiohttp[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"

# Optional: enable tests if you want to run them
# IUSE="test"
# RESTRICT="!test? ( test )"
#
# BDEPEND="
# 	test? (
# 		${RDEPEND}
# 		dev-python/pytest[${PYTHON_USEDEP}]
# 		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
# 	)
# "
#
# python_test() {
# 	epytest || die
# }
