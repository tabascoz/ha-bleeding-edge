# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

DESCRIPTION="GraphQL-core is a Python port of GraphQL.js"
HOMEPAGE="
	https://github.com/graphql-python/graphql-core/
	https://pypi.org/project/graphql-core/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

EPYTEST_IGNORE=(
	# avoid pytest-benchmark
	"tests/benchmarks/"
)

EPYTEST_PLUGINS=( anyio pytest-describe pytest-timeout )
distutils_enable_tests pytest

python_test() {
	# avoid pytest-benchmark
	epytest -o addopts= tests
}
