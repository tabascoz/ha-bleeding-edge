# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
PYPI_PN="pyicloud"

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="PyiCloud is a module which allows pythonistas to interact with iCloud webservices."
HOMEPAGE="https://github.com/timlaing/pyicloud https://pypi.org/project/pyicloud/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/certifi-2026.4.22[${PYTHON_USEDEP}]
	>=dev-python/cryptography-44.0.0[${PYTHON_USEDEP}]
	>=dev-python/fido2-2.2.0[${PYTHON_USEDEP}]
	>=dev-python/keyring-25.7.0[${PYTHON_USEDEP}]
	>=dev-python/keyrings-alt-5.0.2[${PYTHON_USEDEP}]
	>=dev-python/protobuf-6.32.0[${PYTHON_USEDEP}]
	<dev-python/protobuf-8[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.13.4[${PYTHON_USEDEP}]
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/srp-1.0.22[${PYTHON_USEDEP}]
	>=dev-python/tinyhtml-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-5.3.1[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		=dev-python/bbpb-1.4.2[${PYTHON_USEDEP}]
		>=dev-python/isort-8.0.1[${PYTHON_USEDEP}]
		>=dev-python/prek-0.3.1[${PYTHON_USEDEP}]
		>=dev-python/pylint-4.0.5[${PYTHON_USEDEP}]
		>=dev-python/pylint-strict-informational-0.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-9.0.3[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-7.1.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-socket-0.7.0[${PYTHON_USEDEP}]
		>=dev-python/ruff-0.15.15[${PYTHON_USEDEP}]
		>=dev-python/types-requests-2.32.0[${PYTHON_USEDEP}]
		>=dev-python/click-8.4.1[${PYTHON_USEDEP}]
		>=dev-python/rich-15.0.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.16.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
