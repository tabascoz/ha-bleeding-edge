# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
DISTUTILS_EXT=1
PYTHON_COMPAT=( python3_{10..14} )

CRATES="
	aead@0.5.2
	aes@0.8.4
	anyhow@1.0.104
	arrayvec@0.7.8
	base64@0.22.1
	base64ct@1.8.3
	block-buffer@0.10.4
	block-padding@0.3.3
	bytes@1.12.1
	cbc@0.1.2
	cfg-if@1.0.4
	chacha20@0.9.1
	chacha20poly1305@0.10.1
	cipher@0.4.4
	const-oid@0.9.6
	cpufeatures@0.2.17
	crypto-common@0.1.7
	curve25519-dalek-derive@0.1.1
	curve25519-dalek@4.1.3
	der@0.7.10
	digest@0.10.7
	ed25519-dalek@2.2.0
	ed25519@2.2.3
	either@1.16.0
	equivalent@1.0.2
	fiat-crypto@0.2.9
	generic-array@0.14.7
	getrandom@0.2.17
	hashbrown@0.17.1
	heck@0.5.0
	hkdf@0.12.4
	hmac@0.12.1
	indexmap@2.14.0
	inout@0.1.4
	itertools@0.14.0
	itoa@1.0.18
	libc@0.2.189
	matrix-pickle-derive@0.2.3
	matrix-pickle@0.2.3
	memchr@2.8.3
	once_cell@1.21.4
	opaque-debug@0.3.1
	paste@1.0.15
	pkcs8@0.10.2
	poly1305@0.8.0
	portable-atomic@1.14.0
	ppv-lite86@0.2.21
	proc-macro-crate@3.5.0
	proc-macro2@1.0.107
	prost-derive@0.14.4
	prost@0.14.4
	pyo3-build-config@0.29.0
	pyo3-ffi@0.29.0
	pyo3-macros-backend@0.29.0
	pyo3-macros@0.29.0
	pyo3@0.29.0
	quote@1.0.47
	rand@0.8.7
	rand_chacha@0.3.1
	rand_core@0.6.4
	rustc_version@0.4.1
	semver@1.0.28
	serde@1.0.229
	serde_bytes@0.11.19
	serde_core@1.0.229
	serde_derive@1.0.229
	serde_json@1.0.151
	sha2@0.10.9
	signature@2.2.0
	spki@0.7.3
	subtle@2.6.1
	syn@2.0.119
	syn@3.0.3
	target-lexicon@0.13.5
	thiserror-impl@2.0.19
	thiserror@2.0.19
	toml_datetime@1.1.1+spec-1.1.0
	toml_edit@0.25.13+spec-1.1.0
	toml_parser@1.1.2+spec-1.1.0
	typenum@1.20.1
	unicode-ident@1.0.24
	universal-hash@0.5.1
	version_check@0.9.5
	vodozemac@0.10.0
	wasi@0.11.1+wasi-snapshot-preview1
	winnow@1.0.4
	x25519-dalek@2.0.1
	zerocopy-derive@0.8.55
	zerocopy@0.8.55
	zeroize@1.9.0
	zeroize_derive@1.5.0
	zmij@1.0.23
"

RUST_MIN_VER="1.85.0"

inherit cargo distutils-r1

MY_PV=${PV/_p/.post}
MY_P=${PN}-${MY_PV}

DESCRIPTION="Python bindings for vodozemac"
HOMEPAGE="
	https://pypi.org/project/vodozemac/
	https://github.com/matrix-nio/vodozemac-python
"
SRC_URI="
	https://github.com/matrix-nio/vodozemac-python/archive/refs/tags/${MY_PV}.tar.gz -> ${P}.tar.gz
	${CARGO_CRATE_URIS}
"
S=${WORKDIR}/${MY_P}

LICENSE="MIT"
# Dependent crate licenses
LICENSE+="
	Apache-2.0 Apache-2.0-with-LLVM-exceptions BSD MIT Unicode-3.0
"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
"
BDEPEND="
	test? (
		dev-python/pytest
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

# See https://projects.gentoo.org/python/guide/test.html#importerrors-for-c-extensions
python_test() {
	rm -rf vodozemac || die
	epytest
}
