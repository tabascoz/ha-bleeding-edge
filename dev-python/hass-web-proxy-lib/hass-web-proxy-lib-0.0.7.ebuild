# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A small Home Assistant library to proxy web traffic through Home Assistant. Used by the Home Assistant Web Proxy Integration and any other integration that needs to proxy traffic through Home Assistant."
HOMEPAGE="https://pypi.org/project/hass-web-proxy-lib/ https://github.com/dermotduffy/hass-web-proxy-lib"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test debug"
RESTRICT="!test? ( test )"
#S="${WORKDIR}" 

#DOCS="README.md"

PATCHES=( "${FILESDIR}/${P}-add-build.patch" )

distutils_enable_tests pytest
