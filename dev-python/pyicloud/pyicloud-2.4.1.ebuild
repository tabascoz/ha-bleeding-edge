# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="PyiCloud is a module which allows pythonistas to interact with iCloud webservices."
HOMEPAGE="https://github.com/picklepete/pyicloud https://pypi.org/project/pyicloud/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
    >=dev-python/certifi-2024.12.14[${PYTHON_USEDEP}]
    >=dev-python/click-8.1.8[${PYTHON_USEDEP}]
    >=dev-python/fido2-2.0.0[${PYTHON_USEDEP}]
    >=dev-python/keyring-25.6.0[${PYTHON_USEDEP}]
    >=dev-python/keyrings-alt-5.0.2[${PYTHON_USEDEP}]
    >=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
    >=dev-python/srp-1.0.21[${PYTHON_USEDEP}]
    =dev-python/tzlocal-5.3.1[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        >=dev-python/isort-5.11.5[${PYTHON_USEDEP}]
        >=dev-python/prek-0.3.1[${PYTHON_USEDEP}]
        >=dev-python/pylint-3.3.4[${PYTHON_USEDEP}]
        >=dev-python/pylint-strict-informational-0.1[${PYTHON_USEDEP}]
        >=dev-python/pytest-8.3.5[${PYTHON_USEDEP}]
        >=dev-python/pytest-cov-4.1.0[${PYTHON_USEDEP}]
        >=dev-python/pytest-socket-0.6.0[${PYTHON_USEDEP}]
        >=dev-python/ruff-0.9.9[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest