# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="The official Python library for the Fish Audio API"
HOMEPAGE="https://pypi.org/project/fish-audio-sdk/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="utils"

RDEPEND="
    >=dev-python/httpx-ws-0.6.2[${PYTHON_USEDEP}]
    >=dev-python/httpx-0.27.2[${PYTHON_USEDEP}]
    >=dev-python/ormsgpack-1.5.0[${PYTHON_USEDEP}]
    >=dev-python/pydantic-2.9.1[${PYTHON_USEDEP}]
    >=dev-python/typing-extensions-4.15.0[${PYTHON_USEDEP}]
    utils? (
        >=dev-python/sounddevice-0.4.6[${PYTHON_USEDEP}]
        >=dev-python/soundfile-0.12.1[${PYTHON_USEDEP}]
    )
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"