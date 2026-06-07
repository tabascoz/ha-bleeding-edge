# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi
DESCRIPTION="Library for interacting with UPB PIM."
HOMEPAGE="https://github.com/gwww/upb-lib https://pypi.org/project/upb-lib/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="CHANGELOG.md"

RDEPEND="
	>=dev-python/pytz-2021[${PYTHON_USEDEP}]
	>=dev-python/serialx-1.4.0[${PYTHON_USEDEP}]
	<dev-python/serialx-2[${PYTHON_USEDEP}]
"

src_prepare() {
	sed -e 's/"CHANGELOG.md",//' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest