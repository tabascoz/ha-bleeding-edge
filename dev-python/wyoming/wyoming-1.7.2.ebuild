# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Peer-to-peer protocol for voice assistants"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="zeroconf http test"
RESTRICT="!test? ( test )"

RDEPEND="
    zeroconf? ( >=dev-python/zeroconf-0.88.0[${PYTHON_USEDEP}] )
    http? (
        >=dev-python/flask-3.0.2[${PYTHON_USEDEP}]
        >=dev-python/swagger-ui-py-23.9.23[${PYTHON_USEDEP}]
    )
"

BDEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest