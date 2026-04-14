# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A python library for controlling a sky box"
HOMEPAGE="https://pypi.org/project/${PN}/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pylint[${PYTHON_USEDEP}]
        dev-python/pylint-junit[${PYTHON_USEDEP}]
        =dev-python/pytest-cov-4.0.0[${PYTHON_USEDEP}]
        <dev-python/pytest-mock-3.10.1[${PYTHON_USEDEP}]
        >=dev-python/pyspark-3.0.0[${PYTHON_USEDEP}]
        dev-python/bandit[${PYTHON_USEDEP}]
        =dev-python/black-23.3.0[${PYTHON_USEDEP}]
        =dev-python/check-manifest-0.49[${PYTHON_USEDEP}]
        =dev-python/flake8-bugbear-23.5.9[${PYTHON_USEDEP}]
        dev-python/flake8-docstrings[${PYTHON_USEDEP}]
        dev-python/flake8-formatter-junit-xml[${PYTHON_USEDEP}]
        dev-python/flake8[${PYTHON_USEDEP}]
        dev-python/flake8-pyproject[${PYTHON_USEDEP}]
        =dev-python/pre-commit-3.3.1[${PYTHON_USEDEP}]
        dev-python/pytest-runner[${PYTHON_USEDEP}]
        =dev-python/pytest-7.3.1[${PYTHON_USEDEP}]
        dev-python/pytest-github-actions-annotate-failures[${PYTHON_USEDEP}]
        =dev-python/shellcheck-py-0.9.0.2[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest