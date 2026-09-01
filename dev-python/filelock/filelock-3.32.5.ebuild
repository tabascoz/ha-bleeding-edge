# Copyright 2018-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

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