# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Settings management using Pydantic"
HOMEPAGE="
	https://github.com/pydantic/pydantic-settings/
	https://pypi.org/project/pydantic-settings/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="aws-secrets-manager azure-key-vault gcp-secret-manager test toml yaml"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/pydantic-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/typing-inspection-0.4.0[${PYTHON_USEDEP}]
	aws-secrets-manager? ( >=dev-python/boto3-1.35.0[${PYTHON_USEDEP}] )
	azure-key-vault? (
		>=dev-python/azure-identity-1.16.0[${PYTHON_USEDEP}]
		>=dev-python/azure-keyvault-secrets-4.8.0[${PYTHON_USEDEP}]
	)
	gcp-secret-manager? ( >=dev-python/google-cloud-secret-manager-2.23.1[${PYTHON_USEDEP}] )
	toml? ( >=dev-python/tomli-2.0.1[${PYTHON_USEDEP}] )
	yaml? ( >=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest