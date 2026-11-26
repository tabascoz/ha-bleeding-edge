# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python bindings for NanoTTS (PicoTTS)"
HOMEPAGE="https://github.com/rhasspy/py-nanotts"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"