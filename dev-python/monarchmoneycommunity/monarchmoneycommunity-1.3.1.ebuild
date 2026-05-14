# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Python library for accessing Monarch Money data (community fork)"
HOMEPAGE="https://github.com/bradleyseanf/monarchmoneycommunity"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="test"

RDEPEND="
    dev-python/gql
    dev-python/httpx
    dev-python/pydantic
"

BDEPEND="
    test? (
        dev-python/pytest
    )
"

RESTRICT="!test? ( test )"

distutils_enable_tests pytest
