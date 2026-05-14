# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )
inherit distutils-r1 pypi

DESCRIPTION="Variables defined by the XDG Base Directory Specification"
HOMEPAGE="https://pypi.org/project/xdg/"

LICENSE="ISC"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# otherwise installed directory name conflicts
RDEPEND="!!dev-python/pyxdg"
