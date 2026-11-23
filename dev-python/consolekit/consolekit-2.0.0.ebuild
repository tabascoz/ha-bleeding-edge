# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Additional utilities for click"
HOMEPAGE="https://github.com/domdfcoding/consolekit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/click-7.1.2[${PYTHON_USEDEP}]
	>=dev-python/domdf-python-tools-3.8.0[${PYTHON_USEDEP}]
	>=dev-python/mistletoe-0.7.2[${PYTHON_USEDEP}]
	!=dev-python/typing-extensions-3.10.0.1
	>=dev-python/typing-extensions-3.10.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/coincidence[${PYTHON_USEDEP}]
		>=dev-python/pytest-6.0.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-regressions-2.0.2[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( pytest-{datadir,regressions} )
distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# AssertionError: FILES DIFFER
	tests/test_options.py::test_prompt_option
)