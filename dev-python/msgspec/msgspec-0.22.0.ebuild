# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A fast serialization and validation library, with builtin support for JSON, MessagePack, YAML, and TOML."
HOMEPAGE="https://pypi.org/project/msgspec/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/tomli-1.1.0[${PYTHON_USEDEP}]
    <dev-python/tomli-2.0.0[${PYTHON_USEDEP}]
    dev-python/tomli-w[${PYTHON_USEDEP}]
    dev-python/pyyaml[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/attrs[${PYTHON_USEDEP}]
        dev-python/msgpack[${PYTHON_USEDEP}]
        dev-python/pyyaml[${PYTHON_USEDEP}]
        dev-python/tomli-w[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest
python_test() {
	local EPYTEST_IGNORE=(
		# Lint tests
		tests/unit/test_cpylint.py
	)

	rm -rf msgspec || die
	epytest tests/unit
}