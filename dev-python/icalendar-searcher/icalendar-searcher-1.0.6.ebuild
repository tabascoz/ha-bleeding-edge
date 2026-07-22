# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Search, filter and sort iCalendar components"
HOMEPAGE="https://pypi.org/project/icalendar-searcher/"

LICENSE="AGPL-3.0-or-later"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/icalendar-6.0[${PYTHON_USEDEP}]
	>=dev-python/recurring-ical-events-3.8.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-8.0.0[${PYTHON_USEDEP}]
		<dev-python/pytest-10.0.0[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest