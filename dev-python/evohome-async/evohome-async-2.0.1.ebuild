# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit distutils-r1 pypi
DESCRIPTION="An async client for connecting to Honeywell's TCC RESTful API."
HOMEPAGE="https://github.com/zxdavb/evohome-async/ https://pypi.org/project/evohome-async/"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"
DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.13.5[${PYTHON_USEDEP}]
	>=dev-python/aiozoneinfo-0.2.3[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.15.2[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/asyncclick[${PYTHON_USEDEP}]
	dev-python/debugpy[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/hatch-1.17.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-9.1.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-1.4.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-freezer-0.4.9[${PYTHON_USEDEP}]
		>=dev-python/syrupy-5.3.2[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	eapply_user
}