# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1
SRC_URI="$(pypi_sdist_url)"

DESCRIPTION="A python library for controlling a sky box"
HOMEPAGE="https://pypi.org/project/skyboxremote/"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND=""
DEPEND="${RDEPEND}"

python_test() {
    epytest || die
    }