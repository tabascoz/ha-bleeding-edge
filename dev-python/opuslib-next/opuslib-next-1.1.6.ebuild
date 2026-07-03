# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="Python bindings to the libopus, IETF low-delay audio codec"
HOMEPAGE="https://pypi.org/project/opuslib-next/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	media-libs/opus
"
BDEPEND="
	>=dev-python/hatchling-1.0[${PYTHON_USEDEP}]
"