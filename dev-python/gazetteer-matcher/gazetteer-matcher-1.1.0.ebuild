# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Constraint-driven gazetteer matcher for Home Assistant intents"
HOMEPAGE="https://pypi.org/project/gazetteer-matcher/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/unicode-rbnf-2.4.0[${PYTHON_USEDEP}]
	>=dev-python/home-assistant-intents-2026.8.24[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-8.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest