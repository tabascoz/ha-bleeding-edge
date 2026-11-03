# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Generate and work with holidays in Python"
HOMEPAGE="https://github.com/vacanza/holidays https://pypi.org/project/holidays/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

# bounds raised by hand (2026-11-03) — python-dateutil floor raised to 4.0.0, the <3 ceiling dropped: this release's
# requirement for this very version IS python-dateutil>=4.0.0 (requirements_all.txt:5583).
# holidays calls dateutil.parser.parse and dateutil.easter (EASTER_ORTHODOX/EASTER_WESTERN/easter,
# all present in 4.0.0, same values: tmp/probe3_behaviors.py); 4.0 needs dev-python/tzdata (installed
# at 10001) and no longer six. Only isoparse got stricter, and holidays never calls isoparse.
RDEPEND="
	>=dev-python/python-dateutil-4.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest