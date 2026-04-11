# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1
DESCRIPTION="Google Gen AI Python SDK provides an interface for developers to integrate Google's generative models into their Python applications. It supports the Gemini Developer API and Vertex AI APIs."
HOMEPAGE="https://github.com/googleapis/python-genai https://pypi.org/project/google-genai/"
MY_PN="google-genai"
SRC_URI="https://github.com/googleapis/python-genai/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"
#SRC_URI="https://github.com/google/generative-ai-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.gh.tar.gz"

S=${WORKDIR}/${MY_PN}-${PV}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/absl-py-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/annotated-types-0.7.0[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.8.0[${PYTHON_USEDEP}]
	>=dev-python/cachetools-5.5.0[${PYTHON_USEDEP}]
	>=dev-python/certifi-2024.8.30[${PYTHON_USEDEP}]
	>=dev-python/charset-normalizer-3.4.0[${PYTHON_USEDEP}]
	>=dev-python/coverage-7.6.9[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.37.0[${PYTHON_USEDEP}]
	>=dev-python/idna-3.10[${PYTHON_USEDEP}]
	>=dev-python/iniconfig-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-24.2[${PYTHON_USEDEP}]
	>=dev-python/pillow-11.0.0[${PYTHON_USEDEP}]
	>=dev-python/pluggy-1.5.0[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/pyasn1-modules-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.3[${PYTHON_USEDEP}]
	>=dev-python/pytest-8.3.4[${PYTHON_USEDEP}]
	>=dev-python/pytest-asyncio-0.25.0[${PYTHON_USEDEP}]
	>=dev-python/pytest-cov-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.32.4[${PYTHON_USEDEP}]
	>=dev-python/rsa-4.9[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.12.2[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.2.3[${PYTHON_USEDEP}]
	>=dev-python/websockets-15.0.0[${PYTHON_USEDEP}]"

src_unpack() {
	unpack ${A}
	echo ${P}
	mv python-genai-${PV}  google-genai-${PV} 
	}

PATCHES=( "${FILESDIR}/${P}-add-build.patch" )
