# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="A feature-rich command-line audio/video downloader"
HOMEPAGE="https://pypi.org/project/yt-dlp/"

LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="default"

RDEPEND="
	default? (
		app-arch/brotli[${PYTHON_USEDEP}]
		dev-python/certifi[${PYTHON_USEDEP}]
		dev-python/mutagen[${PYTHON_USEDEP}]
		dev-python/pycryptodomex[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.2[${PYTHON_USEDEP}]
		<dev-python/requests-3[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.0.2[${PYTHON_USEDEP}]
		<dev-python/urllib3-3[${PYTHON_USEDEP}]
		>=dev-python/websockets-13.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	>=dev-python/hatchling-1.0[${PYTHON_USEDEP}]
"