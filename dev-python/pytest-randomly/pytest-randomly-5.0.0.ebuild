# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Pytest plugin to randomly order tests and control random.seed"
HOMEPAGE="
	https://github.com/pytest-dev/pytest-randomly
	https://pypi.org/project/pytest-randomly/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND=">=dev-python/pytest-8[${PYTHON_USEDEP}]"

distutils_enable_tests pytest