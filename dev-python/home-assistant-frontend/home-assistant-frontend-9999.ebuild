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
	# must not be reachable by keyword, or portage could install whatever that tree holds that
	# day and any package naming it in a dependency would drag an unpinnable tree in. The
	# assignment is written rather than omitted so the intent is in the file: portage treats
	# both the same (an explicit request answers `masked by: missing keyword` even for the
	# master's own `KEYWORDS=""` live efiles - measured 2026-10-29 on this tree and on
	# gentoo/app-portage/hackport/hackport-9999.ebuild:19) - and the gentoo master writes
	# this same form in 40 of its live efiles. What the form does buy is the guarantee above:
	# unstable markers (`~amd64 ~arm64`) would keep the snapshot selectable, which is what
	# someone wanted to avoid. Stable markers here would also be wrong in kind (step 10's rule).
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
