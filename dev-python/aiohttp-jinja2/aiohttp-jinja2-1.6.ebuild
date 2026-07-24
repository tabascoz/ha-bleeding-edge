# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
PYPI_NO_NORMALIZE=1
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="jinja2 template renderer for aiohttp.web"
HOMEPAGE="https://pypi.org/project/aiohttp-jinja2/ https://github.com/aio-libs/aiohttp-jinja2"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    >=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
    >=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
"

BDEPEND="
    ${RDEPEND}
"