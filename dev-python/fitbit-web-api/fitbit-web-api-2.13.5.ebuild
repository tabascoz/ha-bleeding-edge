# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Fitbit Web API"
HOMEPAGE="https://pypi.org/project/fitbit-web-api/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

# bounds raised by hand (2026-11-03) — python-dateutil raised to the >=4.0.0 this release asks of this version
# (requirements_all.txt:5583); the 2.8.2 floor and <3 ceiling came from the sdist metadata of
# the release this efile was built from and are stale now. fitbit_web_api calls only dateutil.parser.parse
# (api_client.py:23), identical under 4.0.0 (tmp/probe3_behaviors.py). The aiohttp-retry and
# urllib3 ceilings are other libraries and stay as they are.
RDEPEND="
	>=dev-python/aiohttp-retry-2.9.1[${PYTHON_USEDEP}]
	<dev-python/aiohttp-retry-3[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.13.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.1.0[${PYTHON_USEDEP}]
	<dev-python/urllib3-3[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
