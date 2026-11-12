# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="CoAP-over-DTLS (OCF) transport and polling layer for SmartThings"
HOMEPAGE="https://github.com/QuiteYellow/SmartThings-Local https://pypi.org/project/smartthings-local/"

S="${WORKDIR}/smartthings_local-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DOCS="README.md"

RDEPEND="
	>=dev-python/cbor2-5.6[${PYTHON_USEDEP}]
	>=dev-python/cryptography-38.0[${PYTHON_USEDEP}]
	>=dev-python/pyopenssl-23.1[${PYTHON_USEDEP}]
"
