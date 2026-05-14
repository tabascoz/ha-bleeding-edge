# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python library for the Teslemetry Streaming API"
HOMEPAGE="https://pypi.org/project/teslemetry-stream/ https://github.com/Teslemetry/python-teslemetry-stream"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# Dependencies from pyproject.toml / poetry (as of latest release)
# Core runtime deps: aiohttp, typing-extensions
RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"

# No tests in the upstream package currently, so restrict testing
RESTRICT="test"
