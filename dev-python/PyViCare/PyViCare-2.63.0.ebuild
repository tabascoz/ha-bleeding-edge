# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
PYPI_PN="PyViCare"
inherit distutils-r1 pypi
DESCRIPTION="Library to communicate with the Viessmann ViCare API"
HOMEPAGE="https://github.com/somm15/PyViCare https://pypi.org/project/PyViCare/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"



# PyViCare declares deprecated<2.0 upstream, but no registered repo carries
# dev-python/deprecated below 2.0.0 (only the unregistered tgbugs-overlay has
# 1.3.1), so that upper bound was dead and made this ebuild unmergeable. It is
# dropped and the floor raised to the newest version any repo carries (gentoo
# 3.0.0/3.0.1). Deviation from the upstream pin, recorded for 2026.11.1-r1.
# The note stays above the assignment: inside a quoted DEPEND string '#' is
# not a comment, it is handed to the dependency parser.
RDEPEND=">=dev-python/authlib-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/deprecated-3.0.1[${PYTHON_USEDEP}]"

BDEPEND=">=dev-python/authlib-1.2.0[${PYTHON_USEDEP}]"

distutils_enable_tests pytest
