# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=poetry
inherit pypi distutils-r1

DESCRIPTION="Python API Wrapper for PlayStation Network API"
HOMEPAGE="https://pypi.org/project/psnawp/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/pycountry-26.2.16[${PYTHON_USEDEP}]
	<dev-python/pycountry-27.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyrate-limiter-4.1.0[${PYTHON_USEDEP}]
	<dev-python/pyrate-limiter-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.33.1[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.15.0[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
"