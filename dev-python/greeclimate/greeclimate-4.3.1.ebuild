# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Discover, connect and control Gree based minisplit systems"
HOMEPAGE="https://github.com/cmroche/greeclimate https://pypi.org/project/greeclimate/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

# Upstream caps pycryptodome <4.0.0 (a tested-with bound). Both hosts run the ::gentoo
# 4.6.0 and step 12 allows zero downgrades, so the cap is dropped and the floor kept:
# a deliberate, recorded deviation from upstream metadata. Measured 2026-11-26,
# 2026.12.0_beta0 (the overlay's own pycryptodome-3.24.1 would have stepped both back).
RDEPEND="~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.24.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest