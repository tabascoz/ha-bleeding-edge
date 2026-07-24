# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Yet another gRPC reflection client"
HOMEPAGE="https://github.com/sparky8512/yagrc https://pypi.org/project/yagrc/"
SRC_URI="https://github.com/sparky8512/yagrc/archive/refs/tags/v${PV}.tar.gz
    -> ${P}.tar.gz"
S="${WORKDIR}/${PN}-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/grpcio-1.12.0[${PYTHON_USEDEP}]
    >=dev-python/grpcio-reflection-1.7.3[${PYTHON_USEDEP}]
    >=dev-python/protobuf-4.22.0[${PYTHON_USEDEP}]
"
BDEPEND="
    dev-python/setuptools-scm[${PYTHON_USEDEP}]
    test? (
	dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest

python_compile() {
    # setuptools-scm can't find version in GitHub tarball (no .git/)
    # Without this → version falls back to 0.0.0 → unknown-0.0.0.dist-info
    export SETUPTOOLS_SCM_PRETEND_VERSION="${PV}"
    distutils-r1_python_compile
}