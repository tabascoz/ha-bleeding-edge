# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi
DESCRIPTION="ClearPass API Python Library"
HOMEPAGE="https://github.com/zemerick1/clearpasspy https://pypi.org/project/clearpasspy/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

# Dead bound relaxed: no registered repo carries a version satisfying
# the original constraint, which made this ebuild unmergeable. Floor kept
# so the resolver takes the newest version any repo carries (never a
# downgrade) and stays compatible with homeassistant-full's own pins.
RDEPEND="
	>=dev-python/requests-2.21.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
