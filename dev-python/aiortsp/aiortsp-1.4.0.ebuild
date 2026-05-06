# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An asyncio-based RTSP library"
HOMEPAGE="https://github.com/marss/aiortsp https://pypi.org/project/aiortsp/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
    >=dev-python/dpkt-1.9[${PYTHON_USEDEP}]
    <dev-python/dpkt-2.0[${PYTHON_USEDEP}]
"
distutils_enable_tests pytest