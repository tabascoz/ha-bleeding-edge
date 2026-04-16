# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi toolchain-funcs

DESCRIPTION="Fast, correct MessagePack library for Python, written in Rust"
HOMEPAGE="https://github.com/ormsgpack/ormsgpack https://pypi.org/project/ormsgpack/"

SRC_URI="$(pypi_sdist_url)"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND=""
DEPEND="${RDEPEND}"

BDEPEND="
    dev-lang/rust-bin
"

# maturin is pulled in automatically by DISTUTILS_USE_PEP517=maturin,
# but we declare it explicitly for clarity
BDEPEND+="
    >=dev-util/maturin-1.0[${PYTHON_USEDEP}]
"

# No tests in the sdist (or very minimal)
RESTRICT="test"

python_test() {
    # If you want to enable tests later, add pytest + ormsgpack[test] extras
    epytest || die
}
