# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Refoss to support for Home Assistant"
HOMEPAGE="https://github.com/ashionky/refoss_ha https://pypi.org/project/refoss-ha/"

SRC_URI="$(pypi_wheel_url --unpack)"
LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

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
