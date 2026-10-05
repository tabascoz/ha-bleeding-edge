# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="plotext plots directly on terminal"
HOMEPAGE="https://github.com/piccolomo/plotext"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="image video"
RESTRICT="test"

RDEPEND="
	image? (
		>=dev-python/pillow-8.4[${PYTHON_USEDEP}]
	)
	video? (
		>=dev-python/pillow-8.4[${PYTHON_USEDEP}]
		>=dev-python/ffpyplayer-4.3.5[${PYTHON_USEDEP}]
		>=dev-python/yt-dlp-2024.1.1[${PYTHON_USEDEP}]
	)
"