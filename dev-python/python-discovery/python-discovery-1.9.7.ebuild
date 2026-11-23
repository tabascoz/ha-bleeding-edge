# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Python interpreter discovery"
HOMEPAGE="
	https://github.com/tox-dev/python-discovery/
	https://pypi.org/project/python-discovery/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/filelock-3.16.1[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		>=dev-python/setuptools-75.1[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( pytest-mock )
EPYTEST_XDIST=1
distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# hatch_build.py only adds the PEP 770 SBOM and imports python_sbom,
	# which comes from dev-python/python-sbom (not packaged)
	sed -i -e '/build\.hooks\.custom\.path/d' pyproject.toml || die
}

python_test() {
	local EPYTEST_IGNORE=(
		# TODO: package vermin?
		tests/test_py_info_collect.py
	)
	local EPYTEST_DESELECT=()

	epytest
}