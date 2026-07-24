# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Bringing the elegance of C# EventHandler to Python"
HOMEPAGE="
    https://pypi.org/project/Events/
    https://github.com/pyeve/events
"
# No sdist on PyPI as of v0.5, only a broken wheel (unknown-0.0.0.dist-info)
SRC_URI="https://github.com/pyeve/events/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"
S="${WORKDIR}/${P,,}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

distutils_enable_tests unittest