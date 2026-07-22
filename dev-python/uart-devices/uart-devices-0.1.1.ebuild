# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{9..14} )

inherit distutils-r1 pypi

DESCRIPTION="UART Devices for Linux"
HOMEPAGE="
	https://github.com/bluetooth-devices/uart-devices
	https://pypi.org/project/uart-devices/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
