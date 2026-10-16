# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Provides an API for querying the distutils metadata written in a PKG-INFO file"
HOMEPAGE="
	https://github.com/tseaver/pkginfo/
	https://pypi.org/project/pkginfo/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

BDEPEND="
	test? (
		dev-python/wheel[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# fragile to Core Metadata version changing in setuptools
	# https://bugs.launchpad.net/pkginfo/+bug/2103804 (again)
	pkginfo/tests/test_installed.py::test_installed_ctor_w_dist_info
)