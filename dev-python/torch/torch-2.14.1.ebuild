# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Tensors and Dynamic neural networks in Python with strong GPU acceleration"
HOMEPAGE="https://pypi.org/project/torch/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="optree opt-einsum pyyaml"

RDEPEND="
	dev-python/filelock[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.10.0[${PYTHON_USEDEP}]
	>=dev-python/setuptools-77.0.3[${PYTHON_USEDEP}]
	>=dev-python/sympy-1.13.3[${PYTHON_USEDEP}]
	>=dev-python/networkx-2.5.1[${PYTHON_USEDEP}]
	dev-python/jinja2[${PYTHON_USEDEP}]
	>=dev-python/fsspec-0.8.5[${PYTHON_USEDEP}]
	optree? ( >=dev-python/optree-0.13.0[${PYTHON_USEDEP}] )
	opt-einsum? ( >=dev-python/opt-einsum-3.3[${PYTHON_USEDEP}] )
	pyyaml? ( dev-python/pyyaml[${PYTHON_USEDEP}] )
"
BDEPEND="
	>=dev-python/setuptools-77.0.3[${PYTHON_USEDEP}]
"