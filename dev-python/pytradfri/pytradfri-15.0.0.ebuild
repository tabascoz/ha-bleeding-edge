# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="IKEA Trådfri/Tradfri API. Control and observe your lights from Python."
HOMEPAGE="https://github.com/home-assistant-libs/pytradfri https://pypi.org/project/pytradfri/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="async test"
RESTRICT="!test? ( test )"

RDEPEND="
	async? (
		dev-python/aiocoap[${PYTHON_USEDEP}]
		dev-python/DTLSSocket[${PYTHON_USEDEP}]
	)
	dev-python/pydantic[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-timeout-2.1.0[${PYTHON_USEDEP}]
		dev-python/flake8[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest