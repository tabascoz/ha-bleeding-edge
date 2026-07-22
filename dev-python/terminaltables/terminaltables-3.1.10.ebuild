# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{8..14} )

inherit distutils-r1 pypi

DESCRIPTION="Generate simple tables in terminals from a nested list of strings"
HOMEPAGE="
	https://github.com/certbot/certbot
	https://pypi.org/project/acme/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
