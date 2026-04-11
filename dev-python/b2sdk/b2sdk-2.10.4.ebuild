# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Backblaze B2 SDK"
HOMEPAGE="https://pypi.org/project/b2sdk/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="full test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/annotated-types-0.5.0[${PYTHON_USEDEP}]
    >=dev-python/logfury-1.0.1[${PYTHON_USEDEP}]
    <dev-python/logfury-2.0.0[${PYTHON_USEDEP}]
    >=dev-python/requests-2.9.1[${PYTHON_USEDEP}]
    <dev-python/requests-3.0.0[${PYTHON_USEDEP}]
    full? (
        >=dev-python/pydantic-2.0.1[${PYTHON_USEDEP}]
        >=dev-python/tqdm-4.5.0[${PYTHON_USEDEP}]
        <dev-python/tqdm-5.0.0[${PYTHON_USEDEP}]
    )
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest