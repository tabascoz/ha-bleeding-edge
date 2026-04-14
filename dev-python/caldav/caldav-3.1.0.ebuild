# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1 pypi

DESCRIPTION="CalDAV (RFC4791) client library for Python"
HOMEPAGE="
	https://github.com/python-caldav/caldav/
	https://pypi.org/project/caldav/
"

LICENSE="|| ( GPL-3 Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/dnspython[${PYTHON_USEDEP}]
	>=dev-python/icalendar-6.0.0[${PYTHON_USEDEP}]
	>=dev-python/icalendar-searcher-1.0.5[${PYTHON_USEDEP}]
	<dev-python/icalendar-searcher-2[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/niquests[${PYTHON_USEDEP}]
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	>=dev-python/recurring-ical-events-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
	dev-python/vobject[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/coverage[${PYTHON_USEDEP}]
		>=dev-python/deptry-0.24.0[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/manuel[${PYTHON_USEDEP}]
		dev-python/proxy-py[${PYTHON_USEDEP}]
		dev-python/pyfakefs[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/radicale[${PYTHON_USEDEP}]
		dev-python/tzlocal[${PYTHON_USEDEP}]
		>=dev-python/xandikos-0.3.3[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest