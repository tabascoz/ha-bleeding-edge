# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1
DESCRIPTION="Google Gen AI Python SDK provides an interface for developers to integrate Google's generative models into their Python applications. It supports the Gemini Developer API and Vertex AI APIs."
HOMEPAGE="https://github.com/googleapis/python-genai https://pypi.org/project/google-genai/"
MY_PN="google-genai"
SRC_URI="https://github.com/googleapis/python-genai/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/anyio-4.8.0[${PYTHON_USEDEP}]
	<dev-python/anyio-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.48.1[${PYTHON_USEDEP}]
	<dev-python/google-auth-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	<dev-python/httpx-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.9.0[${PYTHON_USEDEP}]
	<dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28.1[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}]
	<dev-python/tenacity-9.2.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.14.0[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/websockets-13.0.0[${PYTHON_USEDEP}]
	<dev-python/websockets-17.0[${PYTHON_USEDEP}]
	>=dev-python/distro-1.7[${PYTHON_USEDEP}]
	<dev-python/distro-2[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	aiohttp? (
		>=dev-python/aiohttp-3.10.11[${PYTHON_USEDEP}]
		<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	)
	local-tokenizer? (
		>=dev-python/sentencepiece-0.2.0[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
	)
	pyopenssl? (
		dev-python/pyopenssl[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

src_unpack() {
	unpack ${A}
	echo ${P}
	mv python-genai-${PV}  google-genai-${PV} 
}

PATCHES=( "${FILESDIR}/${P}-add-build.patch" )