# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="A generator library for concise, unambiguous and URL-safe UUIDs."
HOMEPAGE="https://github.com/skorokithakis/shortuuid"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

DOCS=( README.md )

distutils_enable_tests pytest

src_prepare() {
	sed -i -e '/COPYING/d' pyproject.toml || die
	default
}
