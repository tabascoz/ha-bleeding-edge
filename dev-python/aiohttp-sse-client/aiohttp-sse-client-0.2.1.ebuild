# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )
PYPI_NO_NORMALIZE=1

inherit distutils-r1 pypi

DESCRIPTION="A Server-Sent Event python client base on aiohttp"
HOMEPAGE="https://github.com/rtfol/aiohttp-sse-client"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    >=dev-python/aiohttp-3[${PYTHON_USEDEP}]
    dev-python/attrs[${PYTHON_USEDEP}]
    dev-python/multidict[${PYTHON_USEDEP}]
    dev-python/yarl[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"

distutils_enable_tests pytest

#S="${WORKDIR}/aiohttp-sse-client-${PV}"