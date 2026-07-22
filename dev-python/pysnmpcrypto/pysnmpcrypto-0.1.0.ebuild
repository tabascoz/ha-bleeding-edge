# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit pypi distutils-r1

DESCRIPTION="Strong cryptography support for PySNMP (SNMP library for Python)"
HOMEPAGE="https://github.com/lextudio/pysnmpcrypto https://pypi.org/project/pysnmpcrypto/"

LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
    >=dev-python/cryptography-43.0.1[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest