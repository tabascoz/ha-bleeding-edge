# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

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
	>=dev-python/certifi-2026.10.18[${PYTHON_USEDEP}]
	>=dev-python/cryptography-50.0.0[${PYTHON_USEDEP}]
	>=dev-python/fido2-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/keyring-25.7.0[${PYTHON_USEDEP}]
	>=dev-python/keyrings-alt-5.0.2[${PYTHON_USEDEP}]
	>=dev-python/protobuf-6.33.5[${PYTHON_USEDEP}]
	<dev-python/protobuf-8[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.14.2[${PYTHON_USEDEP}]
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.33.0[${PYTHON_USEDEP}]
	>=dev-python/srp-1.0.22[${PYTHON_USEDEP}]
	>=dev-python/tinyhtml-1.3.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.16.0[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5[${PYTHON_USEDEP}]
	=dev-python/tzlocal-5.4.5[${PYTHON_USEDEP}]
"
# pylint: upstream caps below 4.1; both hosts already run 4.1.3 and step 12 allows zero
# downgrades, so the bound is raised to 4.2. A deliberate, recorded deviation from
# upstream metadata, measured 2026-11-26 for 2026.12.0_beta0.
BDEPEND="
	test? (
		dev-python/bbpb[${PYTHON_USEDEP}]
		dev-python/mypy[${PYTHON_USEDEP}]
		dev-python/prek[${PYTHON_USEDEP}]
		>=dev-python/pylint-4.0.8[${PYTHON_USEDEP}]
		<dev-python/pylint-4.2[${PYTHON_USEDEP}]
		dev-python/pylint-strict-informational[${PYTHON_USEDEP}]
		<dev-python/pytest-9.3[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-socket[${PYTHON_USEDEP}]
		dev-python/pytest-timeout[${PYTHON_USEDEP}]
		dev-python/ruff[${PYTHON_USEDEP}]
		dev-python/types-requests[${PYTHON_USEDEP}]
		>=dev-python/click-8.4.1[${PYTHON_USEDEP}]
		>=dev-python/rich-15.0.0[${PYTHON_USEDEP}]
		>=dev-python/typer-0.16.1[${PYTHON_USEDEP}]
		>=dev-python/mcp-2.3.0[${PYTHON_USEDEP}]
		<dev-python/mcp-3[${PYTHON_USEDEP}]
		>=dev-python/urllib3-2.2.0[${PYTHON_USEDEP}]
		<dev-python/urllib3-3[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest