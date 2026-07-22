# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="tools to supplement packaging Python releases"
HOMEPAGE="https://pypi.org/project/jaraco.packaging/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test doc check cover enabler type"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/domdf-python-tools-0.1.0[${PYTHON_USEDEP}]
    >=dev-python/jaraco-context-3.0.0[${PYTHON_USEDEP}]
    >=dev-python/jaraco-packaging-9.3[${PYTHON_USEDEP}]
    dev-python/importlib-metadata[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    >=dev-python/build-1.0.3[${PYTHON_USEDEP}]
    test? (
        >=dev-python/pytest-6.0.0[${PYTHON_USEDEP}]
        !=dev-python/pytest-8.1.0[${PYTHON_USEDEP}]
        dev-python/types-docutils[${PYTHON_USEDEP}]
    )
    doc? (
        >=dev-python/sphinx-3.5[${PYTHON_USEDEP}]
        dev-python/rst-linker[${PYTHON_USEDEP}]
        dev-python/furo[${PYTHON_USEDEP}]
        dev-python/sphinx-lint[${PYTHON_USEDEP}]
    )
    check? (
        dev-python/pytest-checkdocs[${PYTHON_USEDEP}]
        >=dev-python/pytest-ruff-0.2.1[${PYTHON_USEDEP}]
    )
    cover? (
        dev-python/pytest-cov[${PYTHON_USEDEP}]
    )
    enabler? (
        >=dev-python/pytest-enabler-3.4[${PYTHON_USEDEP}]
    )
    type? (
        >=dev-python/pytest-mypy-1.0.1[${PYTHON_USEDEP}]
        dev-python/mypy[${PYTHON_USEDEP}]
        >=dev-python/pytest-mypy-1.0.1[${PYTHON_USEDEP}]
        dev-python/mypy[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest
