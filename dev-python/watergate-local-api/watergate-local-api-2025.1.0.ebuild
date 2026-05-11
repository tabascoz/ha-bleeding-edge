# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python package to interact with the Watergate Local API"
HOMEPAGE="https://github.com/hero-laboratories/watergate-local-api-python"

LICENSE="All-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=""
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

python_install() {
    distutils-r1_python_install

    # Remove stray top-level files
    local sitedir=$(python_get_sitedir)
    rm -rf "${D}${sitedir}/tests"
}

python_prepare_all() {
    # Fix missing version.txt in the PyPI sdist

    echo "2025.1.0" > version.txt || die "Failed to create version.txt"

    # IMPORTANT: Call the eclass function
    distutils-r1_python_prepare_all
}

distutils_enable_tests pytest