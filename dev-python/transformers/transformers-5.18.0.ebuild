# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Transformers: the model-definition framework for state-of-the-art machine learning models in text, vision, audio, and multimodal models, for both inference and training."
HOMEPAGE="https://github.com/huggingface/transformers"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE=""
RDEPEND="
	>=dev-python/huggingface-hub-1.31.0[${PYTHON_USEDEP}]
	<dev-python/huggingface-hub-3.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.17[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	>=dev-python/regex-2025.10.22[${PYTHON_USEDEP}]
	>=sci-ml/tokenizers-0.23.1[${PYTHON_USEDEP}]
	dev-python/typer[${PYTHON_USEDEP}]
	>=dev-python/safetensors-0.8.0[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.60[${PYTHON_USEDEP}]
"
distutils_enable_tests pytest
