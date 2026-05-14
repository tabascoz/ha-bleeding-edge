# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Library to interact with PrusaLink v2"
HOMEPAGE="https://github.com/home-assistant-libs/pyprusalink https://pypi.org/project/pyprusalink/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

PYPI_PN="pyprusalink"

RDEPEND="~dev-python/httpx-0.28.1[${PYTHON_USEDEP}]"

BDEPEND="
	${RDEPEND}
	test? (
		dev-python/pytest
	)
"

distutils_enable_tests pytest
