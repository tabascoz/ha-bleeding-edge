# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Constraint-driven gazetteer matcher for Home Assistant intents"
HOMEPAGE="
	https://github.com/OHF-Voice/gazetteer-matcher
	https://pypi.org/project/gazetteer-matcher/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

# Runtime deps:
#   PyYAML, unicode-rbnf, home-assistant-intents
# The package also builds an optional C++17 fuzzy-scoring extension via
# setup.py (Extension(optional=True)). If no C++ compiler is found, it
# silently falls back to a pure-Python implementation.
RDEPEND="
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/unicode-rbnf-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-intents-2026.8.24[${PYTHON_USEDEP}]
"

BDEPEND="
	test? ( >=dev-python/pytest-8.0[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest
