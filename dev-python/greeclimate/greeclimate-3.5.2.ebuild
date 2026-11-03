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

# bounds raised by hand (2026-11-03) — pycryptodome same-major pin (~) widened to a floor: ~ asks for the 3.24.x line
# only, which is exactly what held 4.3.0 in ::gentoo back. The release's metadata for this
# version asks pycryptodome<5.0.0. greeclimate's CipherV1 (ECB) and CipherV2 (GCM) produce
# byte-identical ciphertext and tags under 4.3.0 (tmp/probe3_behaviors.py). ifaddr's ~ is not touched.
RDEPEND="~dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/pycryptodome-3.24.1[${PYTHON_USEDEP}]"

distutils_enable_tests pytest