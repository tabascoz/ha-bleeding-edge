# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_14 )

inherit distutils-r1

DESCRIPTION="A wizard-like JSON serialization library for Python dataclasses"
HOMEPAGE="
	https://pypi.org/project/dataclass-wizard/
"
SRC_URI="https://github.com/rnag/dataclass-wizard/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/tzdata[${PYTHON_USEDEP}]
	>=dev-python/pytimeparse-1.1.7[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.13.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-1[${PYTHON_USEDEP}]
	<dev-python/python-dotenv-2[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6[${PYTHON_USEDEP}]
	<dev-python/pyyaml-7[${PYTHON_USEDEP}]
	>=dev-python/tomli-w-1[${PYTHON_USEDEP}]
	<dev-python/tomli-w-2[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=( pytest-mock )
distutils_enable_tests pytest

distutils_enable_sphinx docs dev-python/sphinx-issues \
							dev-python/sphinx-autodoc-typehints \
							dev-python/sphinx-copybutton
