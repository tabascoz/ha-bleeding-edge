# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Parsers for the ONVIF events protocol"
HOMEPAGE="https://github.com/openvideolibs/onvif-parsers https://onvif-parsers.readthedocs.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/lxml-6.0.0[${PYTHON_USEDEP}]
    >=dev-python/onvif-zeep-async-4.0.4[${PYTHON_USEDEP}]
    >=dev-python/zeep-4.3.2[${PYTHON_USEDEP}]
"
BDEPEND="
    dev-python/setuptools[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest