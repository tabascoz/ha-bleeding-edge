# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
PYPI_NO_NORMALIZE=1

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A Python 3 library to control OpenRGB"
HOMEPAGE="https://openrgb.org https://github.com/OpenRGB/openrgb-python https://pypi.org/project/${PN}/"

SRC_URI="$(pypi_wheel_url)"
S="${WORKDIR}"


LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 arm arm64 x86"

RDEPEND="
    dev-python/colour
    dev-python/requests
"

BDEPEND="
    dev-python/pip
    dev-python/wheel
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