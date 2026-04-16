# Copyright 2023-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=flit
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A library for comparing dictionaries, iterables, strings and other objects"
HOMEPAGE="
	https://github.com/seperman/deepdiff/
	https://pypi.org/project/deepdiff/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"

RDEPEND="
	>=dev-python/orderly-set-5.5.0[${PYTHON_USEDEP}]
	<dev-python/orderly-set-6.0[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		>=dev-python/pytest-9.0.2[${PYTHON_USEDEP}]
		>=dev-python/pytest-benchmark-5.2.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-7.1.0[${PYTHON_USEDEP}]
		>=dev-python/python-dotenv-1.2.2[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=()

	case ${EPYTHON} in
		python3.13)
			EPYTEST_DESELECT+=(
				# changed exception message
				"tests/test_command.py::TestCommands::test_diff_command[t1_corrupt.json-t2.json-Expecting property name enclosed in double quotes-1]"
			)
			;;
	esac

	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest
}