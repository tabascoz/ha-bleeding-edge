# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Asynchronous library for Jandy iAqualink"
HOMEPAGE="https://github.com/flz/iaqualink-py https://pypi.org/project/iaqualink/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/httpx[${PYTHON_USEDEP}]"
BDEPEND="
	dev-python/pytest-runner
	test? (
		=dev-python/coverage-7.7.1[toml,${PYTHON_USEDEP}]
		=dev-python/pytest-cov-6.0.0[${PYTHON_USEDEP}]
		=dev-python/pytest-icdiff-0.9[${PYTHON_USEDEP}]
		=dev-python/pytest-sugar-1.0.0[${PYTHON_USEDEP}]
		=dev-python/pytest-8.3.5[${PYTHON_USEDEP}]
		=dev-python/respx-0.22.0[${PYTHON_USEDEP}]
	)
"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest