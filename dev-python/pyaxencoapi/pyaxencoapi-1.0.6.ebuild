# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Librairie d'utilisation de l'API REST/Websocket d'Axenco"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
\t>=dev-python/aiohttp-3.8.0[${PYTHON_USEDEP}]
\t>=dev-python/python-socketio-5.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
\t>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
\ttest? (
\t\tdev-python/pytest[${PYTHON_USEDEP}]
\t\tdev-python/pytest-asyncio[${PYTHON_USEDEP}]
\t\tdev-python/aiohttp[${PYTHON_USEDEP}]
\t\tdev-python/aioresponses[${PYTHON_USEDEP}]
\t\tdev-python/coverage[${PYTHON_USEDEP}]
\t\tdev-python/pytest-cov[${PYTHON_USEDEP}]
\t\tdev-python/python-socketio[${PYTHON_USEDEP}]
\t)
"
distutils_enable_tests pytest