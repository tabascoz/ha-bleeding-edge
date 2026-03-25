# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_13 python3_14 )

inherit distutils-r1 pypi

DESCRIPTION="SRTP audio proxy for HomeKit camera streaming"
HOMEPAGE="https://github.com/bdraco/homekit-audio-proxy"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~riscv"

RDEPEND="
    >=dev-python/cryptography-43[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"

S="${WORKDIR}/homekit_audio_proxy-${PV}"

python_test() {
    # If tests are present and you want to run them
    epytest || die
}
