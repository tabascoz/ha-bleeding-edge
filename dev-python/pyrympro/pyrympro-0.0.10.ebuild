# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="A python library to communicate with Read Your Meter Pro."
HOMEPAGE="https://github.com/OnFreund/pyrympro"
SRC_URI="https://github.com/OnFreund/pyrympro/archive/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/aiohttp[${PYTHON_USEDEP}]"

# 0.0.10 moved to dynamic versioning through setuptools-scm; the GitHub archive this
# ebuild fetches carries no .git, so the version must be stated (the pattern this tree
# already uses for dev-python/msmart-ng).
BDEPEND="dev-python/setuptools-scm[${PYTHON_USEDEP}]"

python_prepare_all() {
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_python_prepare_all
}
