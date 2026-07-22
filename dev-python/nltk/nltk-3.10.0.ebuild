# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Natural Language Toolkit"
HOMEPAGE="https://www.nltk.org/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    dev-python/click[${PYTHON_USEDEP}]
    dev-python/defusedxml[${PYTHON_USEDEP}]
    dev-python/joblib[${PYTHON_USEDEP}]
    >=dev-python/regex-2021.8.3[${PYTHON_USEDEP}]
    dev-python/tqdm[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        dev-python/joblib[${PYTHON_USEDEP}]
        >=dev-python/nltk-data-20211221
        dev-python/numpy[${PYTHON_USEDEP}]
        dev-python/pyparsing[${PYTHON_USEDEP}]
        dev-python/pytest-mock[${PYTHON_USEDEP}]
        dev-python/twython[${PYTHON_USEDEP}]
        dev-python/scikit-learn[${PYTHON_USEDEP}]
        dev-python/scipy[${PYTHON_USEDEP}]
        dev-python/matplotlib[${PYTHON_USEDEP}]
    )
"
distutils_enable_tests pytest
PDEPEND=">=dev-python/nltk-data-20250310"

EPYTEST_IGNORE=(
	# Network required
	nltk/test/unit/test_downloader.py
)