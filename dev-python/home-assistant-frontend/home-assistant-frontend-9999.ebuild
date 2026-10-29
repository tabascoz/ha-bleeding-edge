# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
MY_PN=${PN//-/_}

if [[ ${PV} == *9999* ]]; then
	inherit git-r3

	EGIT_REPO_URI="https://github.com/home-assistant/frontend.git"
	EGIT_BRANCH="dev"
	S="${WORKDIR}/${P}/"
	PROPERTIES="live"
	# keywords are deliberately EMPTY on this live (9999) branch: a moving upstream snapshot
	# must not be reachable by keyword, or portage could install whatever the tree holds that
	# day and drag it into another package's dependency set. An explicit request still works
	# (`emerge -pU '=pkg-9999'` answers a row against what is installed - measured 2026-10-29
	# on whey-9999 and esphome-9999), which is what a person asks for; leaving KEYWORDS unset
	# instead masks the package (`masked by: missing keyword`) and nobody can use it, so this
	# line is written rather than omitted. Stable keywords here would be worse than wrong, and
	# the gentoo master uses this same `KEYWORDS=""` form in 40 of its live efiles (step 10's
	# rule). The released branch below keeps its own keywords.
	KEYWORDS=""
else
	MY_PV=${PV/_beta/b}
	MY_P=${MY_PN}-${MY_PV}
	SRC_URI="https://github.com/home-assistant/frontend/releases/download/${MY_PV}/${MY_PN}-${MY_PV}.tar.gz -> ${P}-artifacts.gh.tar.gz"
	S="${WORKDIR}/${MY_PN}-${PV}"
	KEYWORDS="~amd64 ~arm64"
fi

DESCRIPTION="The Home Assistant frontend"
HOMEPAGE="https://github.com/home-assistant/frontend https://pypi.org/project/home-assistant-frontend/"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"

distutils_enable_tests pytest
