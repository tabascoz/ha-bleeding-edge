# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="WebSocket client for Python with low level API options"
HOMEPAGE="
	https://github.com/websocket-client/websocket-client/
	https://pypi.org/project/websocket-client/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="examples test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		dev-python/python-socks[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests unittest

python_install_all() {
	if use examples; then
		docompress -x "/usr/share/doc/${PF}/examples"
		dodoc -r examples
	fi
	distutils-r1_python_install_all
}