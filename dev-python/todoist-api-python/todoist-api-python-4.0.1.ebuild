# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi

DESCRIPTION="Official Python SDK for the Todoist API."
HOMEPAGE="https://github.com/Doist/todoist-api-python https://pypi.org/project/todoist-api-python/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/annotated-types[${PYTHON_USEDEP}]
	>=dev-python/dataclass-wizard-0.35.4[${PYTHON_USEDEP}]
	<dev-python/dataclass-wizard-1.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	<dev-python/httpx-1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

src_prepare() {
	sed -e '/include =/,/]/d' -i pyproject.toml || die
	eapply_user
}