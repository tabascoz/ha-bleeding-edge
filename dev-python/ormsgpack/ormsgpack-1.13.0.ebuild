# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{12..14} )

RUST_MIN_VER="1.81.0"

CRATES="
	ahash@0.8.12
	autocfg@1.5.0
	cfg-if@1.0.4
	chrono@0.4.45
	crunchy@0.2.4
	half@2.7.1
	heck@0.5.0
	itoa@1.0.18
	libc@0.2.180
	num-traits@0.2.19
	once_cell@1.21.3
	portable-atomic@1.13.0
	proc-macro2@1.0.105
	pyo3-build-config@0.30.1
	pyo3-ffi@0.30.1
	pyo3-macros-backend@0.30.1
	pyo3-macros@0.30.1
	pyo3@0.30.1
	quote@1.0.43
	serde@1.0.229
	serde_bytes@0.11.19
	serde_core@1.0.229
	serde_derive@1.0.229
	simdutf8@0.1.5
	smallvec@1.16.2
	syn@2.0.114
	syn@3.0.2
	target-lexicon@0.13.4
	unicode-ident@1.0.22
	version_check@0.9.5
	zerocopy-derive@0.8.33
	zerocopy@0.8.33
"


inherit cargo distutils-r1 pypi

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

distutils_enable_tests pytest