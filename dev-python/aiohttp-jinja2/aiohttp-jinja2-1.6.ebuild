# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
# The sdist keeps the dashed spelling (aiohttp-jinja2-1.6.tar.gz) while the
# wheel is aiohttp_jinja2-*. PYPI_NO_NORMALIZE keeps the dashed name verbatim;
# the eclass default normalizes ${PN} to aiohttp_jinja2, which 404s.
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="jinja2 template renderer for aiohttp.web"
HOMEPAGE="https://github.com/aio-libs/aiohttp-jinja2 https://pypi.org/project/aiohttp-jinja2/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/jinja2-3.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
