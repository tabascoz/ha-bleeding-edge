# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="The Slack API Platform SDK for Python"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="optional test"
RESTRICT="!test? ( test )"

RDEPEND="
    optional? (
        >dev-python/aiodns-1.0[${PYTHON_USEDEP}]
        >=dev-python/aiohttp-3.7.3[${PYTHON_USEDEP}]
        <dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
        <=dev-python/boto3-2[${PYTHON_USEDEP}]
        >=dev-python/sqlalchemy-1.4[${PYTHON_USEDEP}]
        <dev-python/sqlalchemy-3.0.0[${PYTHON_USEDEP}]
        >=dev-python/websockets-9.1[${PYTHON_USEDEP}]
        <dev-python/websockets-14.0[${PYTHON_USEDEP}]
        >=dev-python/websocket-client-1.0[${PYTHON_USEDEP}]
        <dev-python/websocket-client-2.0[${PYTHON_USEDEP}]
    )
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest