# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# every crate below is the version rloop's own Cargo.lock (v0.5.0) names; the generated efile
# had no crate set at all, so cargo tried to resolve them and died in the sandbox with
# `failed to get `anyhow` as a dependency` / `download of config.json failed` (measured
# 2026-11-26). Same class as dev-python/epaper-dithering-7.0.1, same remedy.
CRATES="	anyhow@1.0.104
	equivalent@1.0.2
	heck@0.5.0
	libc@0.2.189
	log@0.4.34
	mio@1.2.2
	once_cell@1.21.4
	papaya@0.2.5
	portable-atomic@1.15.0
	proc-macro2@1.0.107
	pyo3@0.29.2
	pyo3-build-config@0.29.2
	pyo3-ffi@0.29.2
	pyo3-macros@0.29.2
	pyo3-macros-backend@0.29.2
	quote@1.0.47
	seize@0.5.1
	socket2@0.6.5
	syn@2.0.119
	target-lexicon@0.13.5
	unicode-ident@1.0.24
	wasi@0.11.1+wasi-snapshot-preview1
	windows-link@0.2.1
	windows-sys@0.61.2"

PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
inherit cargo distutils-r1 pypi

DESCRIPTION="An asyncio event loop implemented in Rust"
HOMEPAGE="https://github.com/gi0baro/rloop"

SRC_URI="$(pypi_sdist_url) ${CARGO_CRATE_URIS}"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

BDEPEND="
	>=dev-lang/rust-1.85
	>=dev-util/maturin-1.10
	test? (
		>=dev-python/pytest-asyncio-0.26[${PYTHON_USEDEP}]
	)
"

src_unpack() {
	cargo_src_unpack
}

distutils_enable_tests pytest