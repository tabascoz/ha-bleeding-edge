# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A generic, spec-compliant, thorough implementation of the OAuth request-signing logic"
HOMEPAGE="
	https://github.com/oauthlib/oauthlib/
	https://pypi.org/project/oauthlib/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# optional extras hard set as RDEPs. See setup.py
RDEPEND="
	>=dev-python/pyjwt-2.0.0[${PYTHON_USEDEP}]
	<dev-python/pyjwt-3[${PYTHON_USEDEP}]
	>=dev-python/blinker-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-3.0.0[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest