# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="Network-local (non-cloud) interface for Powersensor devices"
HOMEPAGE="https://pypi.org/project/powersensor-local/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="zeroconf"

RDEPEND="
	zeroconf? (
		>=dev-python/zeroconf-0.38.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"