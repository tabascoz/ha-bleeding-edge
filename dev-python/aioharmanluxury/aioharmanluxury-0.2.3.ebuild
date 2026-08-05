# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Async client for Harman Luxury Audio / StreamUnlimited network streamers (Arcam Radia, JBL, Mark Levinson)."
HOMEPAGE="https://pypi.org/project/aioharmanluxury/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        ~dev-python/pytest-asyncio-0.24[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest