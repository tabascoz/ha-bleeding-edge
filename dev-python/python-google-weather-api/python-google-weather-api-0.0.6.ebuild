#Copyright 2025 Gentoo Authors
#Distributed under the terms of the GNU General Public License v2
EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A Python client library for Google Weather API"
HOMEPAGE="https://pypi.org/project/python-google-weather-api/"
#SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"
DEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"
RDEPEND="
    >=dev-python/requests-2.25.1[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_compile() {
    distutils-r1_python_compile
}
python_test() {
    # Skip tests if no API key, but assume they run
    distutils_write_config_files
    # Or cd "${BUILD_DIR}" && pytest
    ${EPYTHON} -m pytest -v -v || die "Tests failed with ${EPYTHON}"
}

