# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="ECDSA cryptographic signature library (pure python)"
HOMEPAGE="https://github.com/tlsfuzzer/python-ecdsa https://pypi.org/project/ecdsa/ "

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND=">=dev-python/six-1.9.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest