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
	# unstable keywords on the LIVE branch: a live efile with no keywords at all is masked by
	# `missing keyword`, so even `emerge -p '=pkg-9999'` cannot select it (measured: 8 of the 9
	# live efiles here were unusable). Unstable keywords make it installable when someone asks
	# for it, and never picked up automatically - stable ones would also be wrong (step 10's rule).
	KEYWORDS="~amd64 ~arm64"
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
