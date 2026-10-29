# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# the live branch must build with an interpreter this tree actually has: with the upstream
# compat (10..12) `emerge -p '=app-misc/home-assistant-cli-9999'` answered
# `!!! The ebuild selected to satisfy ‘…-9999’ has unmet requirements` (only 3.14 and
# 3.15 are installed), i.e. nobody could use the live package at all. Same range as every
# other package here, and the released 0.9.6 keeps upstream’s own compat untouched.
PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

if [[ ${PV} == *9999* ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/home-assistant/home-assistant-cli.git"
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
	SRC_URI="https://github.com/home-assistant/${PN}/archive/${PV}.tar.gz -> ${P}.gh.tar.gz"
	# keywords belong to the released branch only: a stable KEYWORDS reachable while the
	# package is live lets portage treat a moving upstream tree as installable by default
	# (measured: this assignment used to sit outside the conditional, at column 1).
	# A live efile carries none: nothing may be pulled from a tree we cannot pin.
	KEYWORDS="~amd64 ~arm64"
fi

DESCRIPTION="The Home Assistant Command-line Interface (hass-cli)"
HOMEPAGE="https://github.com/home-assistant/home-assistant-cli/"

LICENSE="Apache-2.0"
SLOT="0"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/aiohttp-3.9.5[${PYTHON_USEDEP}]
		 >=dev-python/dateparser-1.2.0[${PYTHON_USEDEP}]
		 >=dev-python/jsonpath-ng-1.6.1[${PYTHON_USEDEP}]
		 >=dev-python/jinja2-3.1.4[${PYTHON_USEDEP}]
		 >=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
		 >=dev-python/tabulate-0.9.0[${PYTHON_USEDEP}]
		 >=dev-python/regex-24.5.10[${PYTHON_USEDEP}]
		 >=dev-python/ruamel-yaml-0.18.6[${PYTHON_USEDEP}]
		 >=dev-python/click-8.1.7[${PYTHON_USEDEP}]
		 >=dev-python/click-log-0.4[${PYTHON_USEDEP}]
		 >=dev-python/netdisco-3.0.0[${PYTHON_USEDEP}]"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	test? (
		>=dev-python/mypy-1.10.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.3.1[${PYTHON_USEDEP}]
		>=dev-python/requests-mock-1.12.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-sugar-1.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-5.0.0[${PYTHON_USEDEP}]
	)"

distutils_enable_tests pytest
