# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Backend-neutral LoRaWAN events and device collections for Python."
HOMEPAGE="https://pypi.org/project/lorawan-connection/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="chirpstack test tts"
RESTRICT="!test? ( test )"

# PEP 508 extras this wheel declares (its METADATA's Provides-Extra), modelled here as
# flags so a consumer that asks for lorawan-connection[chirpstack,tts] gets the groups'
# own requirements. Bounds copied verbatim from that METADATA.
RDEPEND="
	chirpstack? ( >=dev-python/chirpstack-api-4.19.0[${PYTHON_USEDEP}] )
	tts? ( >=dev-python/grpcio-1.76[${PYTHON_USEDEP}] <dev-python/grpcio-2.0[${PYTHON_USEDEP}] )
	tts? ( >=dev-python/protobuf-6.31[${PYTHON_USEDEP}] <dev-python/protobuf-8.0[${PYTHON_USEDEP}] )

"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
