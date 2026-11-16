# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
PYPI_PN="pyoverkiz"
inherit distutils-r1 pypi


DESCRIPTION="A fully asynchronous API client for interaction with smart devices connected to OverKiz, supporting multiple vendors such as Somfy TaHoma and Atlantic Cozytouch."
HOMEPAGE="https://github.com/iMicknl/python-overkiz-api https://pypi.org/project/pyoverkiz/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="nexity test"
RESTRICT="!test? ( test )"

DOCS="README.md"

# the nexity extra is the AWS Cognito path (its METADATA); the published 2.1.2 models it
# identically, and the docs extra is documentation tooling only - not modelled, as upstream does.
RDEPEND="
	>=dev-python/aiohttp-3.10.3[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/attrs-22.2[${PYTHON_USEDEP}]
	>=dev-python/python-backoff-1.10.0[${PYTHON_USEDEP}]
	<dev-python/python-backoff-3.1[${PYTHON_USEDEP}]
	>=dev-python/cattrs-23.2[${PYTHON_USEDEP}]
	nexity? ( >=dev-python/boto3-1.18.59[${PYTHON_USEDEP}]
		>=dev-python/warrant-lite-1.0.4[${PYTHON_USEDEP}] )


"
BDEPEND="
	test? (
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
