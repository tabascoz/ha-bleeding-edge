# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A Python library to interface with the Hive API"
HOMEPAGE="https://github.com/Pyhive/pyhiveapi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    dev-vcs/pre-commit
    >=dev-python/boto3-1.16.10[${PYTHON_USEDEP}]
    >=dev-python/botocore-1.19.10[${PYTHON_USEDEP}]
    dev-python/requests[${PYTHON_USEDEP}]
    dev-python/aiohttp[${PYTHON_USEDEP}]
    dev-python/pyquery[${PYTHON_USEDEP}]
    dev-python/loguru[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        dev-python/pre-commit[${PYTHON_USEDEP}]
        dev-python/pylint[${PYTHON_USEDEP}]
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/tox[${PYTHON_USEDEP}]
        dev-python/pbr[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest