# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

PYPI_PN="hatch"

DESCRIPTION="Modern, extensible Python project management"
HOMEPAGE="https://pypi.org/project/hatch/ https://github.com/pypa/hatch"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
	>=dev-python/click-8.0.6[${PYTHON_USEDEP}]
	>=dev-python/distro-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/hatchling-1.27.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.22.0[${PYTHON_USEDEP}]
	>=dev-python/hyperlink-21.0.0[${PYTHON_USEDEP}]
	>=dev-python/keyring-23.5.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	~dev-python/pexpect-4.8[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-2.5.0[${PYTHON_USEDEP}]
	dev-python/pyproject-hooks[${PYTHON_USEDEP}]
	>=dev-python/python-discovery-1.1[${PYTHON_USEDEP}]
	>=dev-python/rich-11.2.0[${PYTHON_USEDEP}]
	>=dev-python/shellingham-1.4.0[${PYTHON_USEDEP}]
	>=dev-python/tomli-w-1.0[${PYTHON_USEDEP}]
	>=dev-python/tomlkit-0.11.1[${PYTHON_USEDEP}]
	~dev-python/userpath-1.7[${PYTHON_USEDEP}]
	>=dev-python/uv-0.5.23[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-21[${PYTHON_USEDEP}]
"

BDEPEND="
	${RDEPEND}
"