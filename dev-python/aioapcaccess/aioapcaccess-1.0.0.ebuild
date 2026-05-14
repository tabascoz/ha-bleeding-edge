# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Async version of apcaccess library implemented in python."
HOMEPAGE="https://github.com/yuxincs/aioapcaccess https://pypi.org/project/aioapcaccess/"
SRC_URI="$(pypi_wheel_url --unpack)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
	app-arch/unzip
"

S="${WORKDIR}"

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
