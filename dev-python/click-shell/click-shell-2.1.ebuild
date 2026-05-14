# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="An extension to click that easily turns your click app into a shell utility"
HOMEPAGE="https://pypi.org/project/click-shell/ https://github.com/clarkperkins/click-shell"

LICENSE="BSD"  # Based on common licensing for click-contrib projects; confirm from repo if needed
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="dev-python/click[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
