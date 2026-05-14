# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Interface for ATEN-PE PDUs"
HOMEPAGE="https://github.com/mtdcr/pductl https://pypi.org/project/atenpdu/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="|| (
	>=dev-python/pysnmp-lextudio-4.3.2[${PYTHON_USEDEP}]
	>=dev-python/pysnmp-4.3.2[${PYTHON_USEDEP}]
	dev-python/pysnmplib[${PYTHON_USEDEP}]
)"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
