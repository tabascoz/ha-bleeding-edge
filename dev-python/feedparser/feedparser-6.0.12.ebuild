# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi
#MY_PV=${PV/_beta/b}
#MY_P=${PN}-${MY_PV}
DESCRIPTION="Parse RSS and Atom feeds in Python"
HOMEPAGE="https://github.com/kurtmckee/feedparser/ 	https://pypi.org/project/feedparser/"
#S=${WORKDIR}/${MY_P}

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

RDEPEND="
	dev-python/sgmllib3k[${PYTHON_USEDEP}]
"

