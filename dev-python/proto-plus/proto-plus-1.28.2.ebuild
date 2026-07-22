# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Beautiful, Pythonic protocol buffers"
HOMEPAGE="
	https://github.com/googleapis/proto-plus-python/
	https://pypi.org/project/proto-plus/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	<dev-python/protobuf-8.0.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.25.8[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/google-api-core-1.31.5[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
EPYTEST_PLUGINS=()