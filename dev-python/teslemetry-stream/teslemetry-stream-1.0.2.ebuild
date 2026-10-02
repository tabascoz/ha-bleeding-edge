# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Asynchronous Python library for the Teslemetry Streaming API"
HOMEPAGE="https://pypi.org/project/teslemetry-stream/ https://github.com/Teslemetry/python-teslemetry-stream"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
"

RESTRICT="test"