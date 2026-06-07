# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="RFC 5545 compatible parser and generator of iCalendar files"
HOMEPAGE="
	https://github.com/collective/icalendar/
	https://pypi.org/project/icalendar/
"

LICENSE="BSD-2"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	dev-python/python-dateutil[${PYTHON_USEDEP}]
	dev-python/tzdata[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/pytz[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( hypothesis )
distutils_enable_tests pytest