# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="An Asynchronous Library for the KNX protocol. Documentation: https://xknx.io/"
HOMEPAGE="https://github.com/XKNX/xknx/ https://xknx.io/ https://pypi.org/project/xknx/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="$(python_gen_cond_dep '>=dev-python/async-timeout-4.0.0[${PYTHON_USEDEP}]' python3_10) \
	$(python_gen_cond_dep 'dev-python/typing-extensions[${PYTHON_USEDEP}]' python3_10) \
	>=dev-python/cryptography-35.0.0[${PYTHON_USEDEP}] \
	>=dev-python/ifaddr-0.1.7[${PYTHON_USEDEP}]"

distutils_enable_tests pytest