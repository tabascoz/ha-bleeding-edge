# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python client library for the Autoskope API."
HOMEPAGE="https://github.com/mcisk/autoskope_client"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        ~dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
        ~dev-python/pytest-asyncio-0.21.0[${PYTHON_USEDEP}]
        ~dev-python/python-dotenv-0.19.0[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest
