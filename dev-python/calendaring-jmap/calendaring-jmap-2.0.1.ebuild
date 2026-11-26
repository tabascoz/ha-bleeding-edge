# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="JMAP (RFC 8620) calendar client library"
HOMEPAGE="https://pypi.org/project/calendaring-jmap/"

LICENSE="AGPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="requests"

RDEPEND="
	>=dev-python/icalendar-7.3.0[${PYTHON_USEDEP}]
	>=dev-python/niquests-3.21.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.3[${PYTHON_USEDEP}]
	>=dev-python/wassima-2.1.5[${PYTHON_USEDEP}]
	requests? (
		>=dev-python/requests-2.34.2[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
"