# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{10..14} )

RUST_MIN_VER="1.83.0"
CRATES="
    ahash-0.8.12
    autocfg-1.5.0
    bytecount-0.6.9
    cfg-if-1.0.4
    chrono-0.4.43
    crunchy-0.2.4
    half-2.7.1
    itoa-1.0.17
    libc-0.2.180
    memoffset-0.9.1
    num-traits-0.2.19
    once_cell-1.21.3
    portable-atomic-1.13.0
    proc-macro2-1.0.105
    pyo3-0.27.2
    pyo3-build-config-0.27.2
    pyo3-ffi-0.27.2
    quote-1.0.43
    serde-1.0.228
    serde_bytes-0.11.19
    serde_core-1.0.228
    serde_derive-1.0.228
    simdutf8-0.1.5
    smallvec-1.15.1
    syn-2.0.114
    target-lexicon-0.13.4
    unicode-ident-1.0.22
    version_check-0.9.5
    zerocopy-0.8.33
    zerocopy-derive-0.8.33
"

inherit cargo distutils-r1 pypi toolchain-funcs

DESCRIPTION="Fast, correct MessagePack library for Python, written in Rust"
HOMEPAGE="https://github.com/ormsgpack/ormsgpack https://pypi.org/project/ormsgpack/"

SRC_URI="$(pypi_sdist_url)"

SRC_URI+=" ${CARGO_CRATE_URIS}"


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
