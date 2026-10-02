# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

SRC_URI="$(pypi_wheel_url)"
DESCRIPTION="Asynchronous library to fetch data from a libreNMS instance."
HOMEPAGE="https://pypi.org/project/aiolibrenms/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

SRC_URI="$(pypi_wheel_url --unpack)"
S="${WORKDIR}"


RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/mashumaro[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

python_prepare_all() {
    # === Fix missing [build-system] section (same as aioacaia) ===
    cat >> pyproject.toml <<- EOF || die
	[build-system]
	requires = ["setuptools >= 68.0"]
	build-backend = "setuptools.build_meta"
EOF

    distutils-r1_python_prepare_all
}


distutils_enable_tests pytest