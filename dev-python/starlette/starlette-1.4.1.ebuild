# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="The little ASGI library that shines."
HOMEPAGE="
	https://www.starlette.io/
	https://github.com/Kludex/starlette/
	https://pypi.org/project/starlette/
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	<dev-python/anyio-5[${PYTHON_USEDEP}]
	>=dev-python/anyio-3.6.2[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/typing-extensions-4.10.0[${PYTHON_USEDEP}]
	' 3.12)
"
BDEPEND="
	test? (
		>=dev-python/pytest-8[${PYTHON_USEDEP}]
		dev-python/httpx2[${PYTHON_USEDEP}]
		dev-python/trio[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( anyio )
: ${EPYTEST_TIMEOUT:-180}
distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# Unpackaged 'databases' dependency
	tests/test_database.py
)