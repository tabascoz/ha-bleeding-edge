# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit git-r3 distutils-r1

EGIT_REPO_URI="https://github.com/georgewhewell/undervolt.git"
DESCRIPTION="Undervolt Intel CPUs under Linux"
HOMEPAGE="https://github.com/georgewhewell/undervolt"

LICENSE="GPL-2"
SLOT="0"
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

src_compile() {
	distutils-r1_src_compile
}

src_install() {
	distutils-r1_src_install
}
