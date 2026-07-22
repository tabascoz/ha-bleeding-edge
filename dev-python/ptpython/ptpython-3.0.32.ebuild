# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )
inherit distutils-r1 pypi

DESCRIPTION="Python REPL build on top of prompt_toolkit"
HOMEPAGE="https://github.com/prompt-toolkit/ptpython"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="ipython"

RDEPEND="
	dev-python/appdirs[${PYTHON_USEDEP}]
	>=dev-python/jedi-0.16.0[${PYTHON_USEDEP}]
	>=dev-python/prompt-toolkit-3.0.43[${PYTHON_USEDEP}]
	<dev-python/prompt-toolkit-3.1.0[${PYTHON_USEDEP}]
	dev-python/pygments[${PYTHON_USEDEP}]
	ipython? (
		dev-python/ipython[${PYTHON_USEDEP}]
	)
"

python_install() {
	distutils-r1_python_install
	if ! use ipython; then
		rm "${ED}"/usr/bin/ptipython* || die
	fi
}