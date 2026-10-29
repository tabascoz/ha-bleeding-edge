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

src_compile() {
	distutils-r1_src_compile
}

src_install() {
	distutils-r1_src_install
}
