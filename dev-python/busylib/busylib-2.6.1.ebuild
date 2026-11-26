# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Python library for Busy Bar API"
HOMEPAGE="https://pypi.org/project/busylib/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/httpx2-2[${PYTHON_USEDEP}]
	<dev-python/httpx2-3[${PYTHON_USEDEP}]
	>=dev-python/protobuf-6.31.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.9[${PYTHON_USEDEP}]
	>=dev-python/pydantic-extra-types-2.9[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.12[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6[${PYTHON_USEDEP}]
	>=dev-python/websockets-12[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.150[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
"