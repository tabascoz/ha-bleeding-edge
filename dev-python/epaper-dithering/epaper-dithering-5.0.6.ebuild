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


DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi cargo

DESCRIPTION="Dithering algorithms optimized for e-paper / e-ink displays"
HOMEPAGE="https://github.com/OpenDisplay-org/epaper-dithering\
    https://pypi.org/project/epaper-dithering/"

SRC_URI="$(pypi_sdist_url) ${CARGO_CRATE_URIS}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
	dev-python/pillow[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"

IUSE="test"
RESTRICT="!test? ( test )"

S="${WORKDIR}/epaper_dithering-${PV}/python"

# Tests are usually minimal or not shipped in sdist
distutils_enable_tests pytest
