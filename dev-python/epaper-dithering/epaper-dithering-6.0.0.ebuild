# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

CRATES="
    crossbeam-deque@0.8.6
    crossbeam-epoch@0.9.18
    crossbeam-utils@0.8.21
    either@1.15.0
    heck@0.5.0
    libc@0.2.183
    once_cell@1.21.4
    portable-atomic@1.13.1
    proc-macro2@1.0.106
    pyo3-build-config@0.28.2
    pyo3-ffi@0.28.2
    pyo3-macros-backend@0.28.2
    pyo3-macros@0.28.2
    pyo3@0.28.2
    quote@1.0.45
    rayon-core@1.13.0
    rayon@1.11.0
    syn@2.0.117
    target-lexicon@0.13.5
    unicode-ident@1.0.24
"

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{12..14} )

inherit cargo distutils-r1 pypi

DESCRIPTION="Dithering algorithms optimized for e-paper / e-ink displays"
HOMEPAGE="
    https://github.com/OpenDisplay-org/epaper-dithering
    https://pypi.org/project/epaper-dithering/
"

SRC_URI="$(pypi_sdist_url) ${CARGO_CRATE_URIS}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    >=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-util/maturin-1.10
"

IUSE="test"
RESTRICT="!test? ( test )"

S="${WORKDIR}/epaper_dithering-${PV}/python"

distutils_enable_tests pytest

src_unpack() {
    cargo_src_unpack
}

src_prepare() {
    distutils-r1_src_prepare

    [[ -f Cargo.toml ]] || die "Missing Cargo.toml in ${S}"

    # The PyPI sdist ships Cargo.toml but no pyproject.toml in python/.
    # Generate the minimal PEP517/maturin metadata that distutils-r1 needs.
    if [[ ! -f pyproject.toml ]]; then
	cat > pyproject.toml <<-EOF || die
	    [build-system]
	    requires = ["maturin>=1.0,<2.0"]
	    build-backend = "maturin"

	    [project]
	    name = "epaper-dithering"
	    version = "${PV}"
	    description = "Dithering algorithms for e-paper/e-ink displays"
	    requires-python = ">=3.11"
	    license = "MIT"
	    dependencies = [
	        "Pillow>=10.0.0",
	    ]

	    [tool.maturin]
	    manifest-path = "Cargo.toml"
	    module-name = "epaper_dithering_rs"
EOF
    fi

    # If a future sdist gains pyproject.toml but uses the upstream root-relative
    # manifest path, fix it because S is already the python/ directory.
    sed -i \
	-e 's|^\([[:space:]]*manifest-path[[:space:]]*=[[:space:]]*\)"python/Cargo.toml"|\1"Cargo.toml"|' \
	pyproject.toml || die

    grep -q '^[[:space:]]*build-backend[[:space:]]*=' pyproject.toml \
	|| die "pyproject.toml still lacks build-backend"
}

src_configure() {
    cargo_src_configure
    distutils-r1_src_configure
}

src_compile() {
    distutils-r1_src_compile
}

src_install() {
    distutils-r1_src_install

    dodoc README.md CHANGELOG.md
    [[ -d docs ]] && dodoc -r docs
}