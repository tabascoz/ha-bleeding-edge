# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Parsing made fun ... using typing"
HOMEPAGE="
	https://github.com/hgrecco/flexparser
	https://pypi.org/project/flexparser/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm64 x86"

BDEPEND="test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
