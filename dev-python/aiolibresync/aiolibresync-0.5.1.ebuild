# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Async client for Libre Wireless LibreSync audio hubs, such as the Platin Stereo Hub"
HOMEPAGE="https://pypi.org/project/aiolibresync/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		>=dev-python/pytest-8.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.24[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest