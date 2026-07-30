# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Music Assistant Client"
HOMEPAGE="https://pypi.org/project/music-assistant-client/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/aiohttp-3.8.6[${PYTHON_USEDEP}]
	=dev-python/music-assistant-models-1.1.152[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-util/codespell[${PYTHON_USEDEP}]
		dev-python/isort[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/pre-commit[${PYTHON_USEDEP}]
		dev-python/pre-commit-hooks[${PYTHON_USEDEP}]
		dev-python/tomli[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	echo -ne '
[build-system]
requires = ["setuptools"]
build-backend = "setuptools.build_meta"
' >> pyproject.toml || die
	default
}

distutils_enable_tests pytest