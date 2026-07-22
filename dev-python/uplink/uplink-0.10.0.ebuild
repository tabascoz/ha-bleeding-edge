# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="A Declarative HTTP Client for Python."
HOMEPAGE="https://github.com/prkumar/uplink https://uplink.readthedocs.io/ https://pypi.org/project/uplink/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
    >=dev-python/requests-2.18.0[${PYTHON_USEDEP}]
    >=dev-python/six-1.13.0[${PYTHON_USEDEP}]
    >=dev-python/uritemplate-3.0.0[${PYTHON_USEDEP}]
    >=dev-python/aiohttp-3.8.1[${PYTHON_USEDEP}]
    >=dev-python/marshmallow-2.15.0[${PYTHON_USEDEP}]
    >=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
    >=dev-python/twisted-21.7.0[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest