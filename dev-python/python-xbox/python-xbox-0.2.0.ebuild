# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A library to authenticate with Xbox Network and use their API"
HOMEPAGE="https://pypi.org/project/${PN}/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="cli test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/cryptography-42.0[${PYTHON_USEDEP}]
    >=dev-python/httpx-0.25.1[${PYTHON_USEDEP}]
    >=dev-python/ms-cv-0.1.1[${PYTHON_USEDEP}]
    >=dev-python/pydantic-2.12[${PYTHON_USEDEP}]
    cli? ( >=dev-python/platformdirs-4.5.0[${PYTHON_USEDEP}] )
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest