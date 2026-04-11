# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python Route B Library: A Communicator for Low-voltage Smart Electric Energy Meters"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/pyserial-3.5[${PYTHON_USEDEP}]
    <dev-python/pyserial-4.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest