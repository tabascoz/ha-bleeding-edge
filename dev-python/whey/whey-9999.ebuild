# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 git-r3 optfeature

DESCRIPTION="A simple Python wheel builder for simple projects"
HOMEPAGE="https://github.com/repo-helper/whey"
EGIT_REPO_URI="https://github.com/repo-helper/${PN}.git"

LICENSE="MIT"
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

RDEPEND="dev-python/attrs[${PYTHON_USEDEP}]
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/consolekit[${PYTHON_USEDEP}]
	dev-python/dist-meta[${PYTHON_USEDEP}]
	dev-python/dom-toml[${PYTHON_USEDEP}]
	dev-python/domdf-python-tools[${PYTHON_USEDEP}]
	dev-python/handy-archives[${PYTHON_USEDEP}]
	dev-python/natsort[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/pyproject-parser[${PYTHON_USEDEP}]
	dev-python/shippinglabel[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]"
BDEPEND="dev-python/hatch-requirements-txt[${PYTHON_USEDEP}]
	test? ( dev-python/editables[${PYTHON_USEDEP}]
		dev-python/pyproject-examples[${PYTHON_USEDEP}]
		dev-python/re-assert[${PYTHON_USEDEP}]
		dev-python/whey-conda[${PYTHON_USEDEP}]
		dev-python/whey-pth[${PYTHON_USEDEP}] )"

EPYTEST_PLUGINS=( coincidence pytest-datadir )
distutils_enable_tests pytest

pkg_postinst() {
	optfeature "integration with editable" dev-python/editables
	optfeature "integration with readme"  dev-python/docutils dev-python/editables pyproject-parser
}
