# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
SRC_URI="$(pypi_wheel_url --unpack)"
S="${WORKDIR}"
DESCRIPTION="A Python 3, asyncio-based library to interact with the PurpleAir API"
HOMEPAGE="https://github.com/bachya/aiopurpleair https://pypi.org/project/aiopurpleair/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}] \
	>=dev-python/certifi-2023.07.22[${PYTHON_USEDEP}] \
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}] <dev-python/pydantic-3.0.0[${PYTHON_USEDEP}] \
	>=dev-python/yarl-1.9.2[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		app-arch/unzip
	)
"

python_prepare_all() {
    # Ensure a clean build-system section for hatchling
    cat >> pyproject.toml <<- EOF || die

    [build-system]
    requires = ["setuptools >= 68.0"]
    build-backend = "setuptools.build_meta"
EOF

    distutils-r1_python_prepare_all
}

distutils_enable_tests pytest
