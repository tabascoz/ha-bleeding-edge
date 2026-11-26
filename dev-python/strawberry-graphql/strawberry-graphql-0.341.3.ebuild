# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=uv-build
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="A library for creating GraphQL APIs"
HOMEPAGE="
	https://strawberry.rocks/
	https://github.com/strawberry-graphql/strawberry/
	https://pypi.org/project/strawberry-graphql/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/graphql-core-3.3.0[${PYTHON_USEDEP}]
	<dev-python/graphql-core-3.4.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.14.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.7[${PYTHON_USEDEP}]
	>=dev-python/packaging-23[${PYTHON_USEDEP}]
	>=dev-python/cross-web-0.6.0[${PYTHON_USEDEP}]
"