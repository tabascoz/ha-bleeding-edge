# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3_11 python3_{13..14} )

inherit distutils-r1 pypi

DESCRIPTION="Library to decode and encode infrared signals (used by Home Assistant)"
HOMEPAGE="https://github.com/home-assistant-libs/infrared-protocols"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~riscv ~x86"

RDEPEND=""
DEPEND="${RDEPEND}"


#S="${WORKDIR}/infrared-protocols-${PV}"

python_test() {
    # If tests are desired (optional)
    epytest || die
}
