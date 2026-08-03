# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Pytest plugin to create CodSpeed benchmarks"
HOMEPAGE="https://pypi.org/project/pytest-codspeed/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/pytest-3.8[${PYTHON_USEDEP}]
    >=dev-python/rich-13.8.1[${PYTHON_USEDEP}]
    >=dev-python/importlib-metadata-8.5.0[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        dev-python/pytest-benchmark[${PYTHON_USEDEP}]
        dev-python/pytest-xdist[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest

pkg_postinst() {
    if use test ; then
        elog "This package requires additional test dependencies:"
        elog "  dev-python/pytest-benchmark"
        elog "  dev-python/pytest-xdist"
    fi
}