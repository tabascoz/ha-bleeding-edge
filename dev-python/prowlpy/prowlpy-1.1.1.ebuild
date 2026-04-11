# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Prowlpy is a python library that implements the public api of Prowl to send push notification to iPhones."
HOMEPAGE="https://pypi.org/project/${PN}/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cli test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/httpx-0.23.0[http2,${PYTHON_USEDEP}]
    >=dev-python/xmltodict-0.13.0[${PYTHON_USEDEP}]
    cli? (
        >=dev-python/click-8.1.0[${PYTHON_USEDEP}]
        >=dev-python/loguru-0.6.0[${PYTHON_USEDEP}]
    )
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest