# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="Kafka integration with asyncio."
HOMEPAGE="https://github.com/aio-libs/aiokafka https://aiokafka.readthedocs.org https://pypi.org/project/aiokafka/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test snappy lz4 zstd gssapi all"
RESTRICT="!test? ( test )"

RDEPEND="dev-python/async-timeout[${PYTHON_USEDEP}] dev-python/packaging[${PYTHON_USEDEP}] >=dev-python/typing-extensions-4.10.0[${PYTHON_USEDEP}] snappy? ( dev-python/cramjam[${PYTHON_USEDEP}] ) lz4? ( >=dev-python/cramjam-2.8.0[${PYTHON_USEDEP}] ) zstd? ( dev-python/cramjam[${PYTHON_USEDEP}] ) gssapi? ( dev-python/gssapi[${PYTHON_USEDEP}] ) all? ( >=dev-python/cramjam-2.8.0[${PYTHON_USEDEP}] dev-python/gssapi[${PYTHON_USEDEP}] )"
BDEPEND="
	>=dev-python/cython-3[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

src_prepare() {
	# remove dynamic-versioning
	sed 's/dynamic = \["version"\]/version = \"'${PV}'\"/g' -i pyproject.toml || die
	eapply_user
}

distutils_enable_tests pytest