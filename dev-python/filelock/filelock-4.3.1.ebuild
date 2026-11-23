# Copyright 2018-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="A platform independent file lock for Python"
HOMEPAGE="
	https://github.com/tox-dev/filelock/
	https://pypi.org/project/filelock/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/virtualenv[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( pytest-{asyncio,mock,timeout} )
EPYTEST_RERUNS=5
distutils_enable_tests pytest

src_prepare() {
	distutils-r1_src_prepare

	# the PEP 770 SBOM build hook needs dev-python/python-sbom, which is not packaged
	sed -i -e '/build\.hooks\.python-sbom/d' pyproject.toml || die
}
