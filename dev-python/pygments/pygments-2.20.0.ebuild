# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Pygments is a syntax highlighting package written in Python"
HOMEPAGE="
	https://pygments.org/
	https://github.com/pygments/pygments/
	https://pypi.org/project/Pygments/
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/colorama[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/lxml[${PYTHON_USEDEP}]
		dev-python/pillow[${PYTHON_USEDEP}]
		dev-python/wcag-contrast-ratio[${PYTHON_USEDEP}]
		virtual/ttf-fonts
	)
"

distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# fuzzing tests, very slow
	tests/test_basic_api.py::test_random_input
	# incompatibility with python-ctags3, apparently
	# https://github.com/pygments/pygments/issues/2486
	tests/test_html_formatter.py::test_ctags
)

EPYTEST_PLUGINS=()
EPYTEST_XDIST=1

python_test() {
	if [[ ${EPYTHON} == python3.14* ]] ; then
		EPYTEST_IGNORE+=(
			# https://github.com/python/cpython/issues/133653
			# https://github.com/python/cpython/pull/133813
			tests/test_cmdline.py
		)
	fi

	epytest
}