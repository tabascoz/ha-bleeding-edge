# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Easily fetch your PTDevice information from the PTDevices servers"
HOMEPAGE="https://pypi.org/project/aioptdevices/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
	>dev-python/orjson-3.9[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-aiohttp[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/aioresponses[${PYTHON_USEDEP}]
	)
"
python_prepare_all() {
    # Remove any existing [build-system] section (upstream one is broken/incomplete for Gentoo)
    sed -i '/^\[build-system\]/,/^$/d' pyproject.toml || die

    # === Fix missing [build-system] section (same as aioacaia) ===
    cat >> pyproject.toml <<- EOF || die
[build-system]
requires = ["setuptools >= 68.0"]
build-backend = "setuptools.build_meta"
EOF

    distutils-r1_python_prepare_all
}


distutils_enable_tests pytest


