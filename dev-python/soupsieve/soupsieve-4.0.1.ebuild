# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A modern CSS selector implementation for Beautiful Soup."
HOMEPAGE="
	https://github.com/facelessuser/soupsieve/
	https://pypi.org/project/soupsieve/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

BDEPEND="
	test? (
		dev-python/beautifulsoup4[${PYTHON_USEDEP}]
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/html5lib[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest