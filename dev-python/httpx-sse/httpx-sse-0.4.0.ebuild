# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( pypy3 python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Consume Server-Sent Event (SSE) messages with HTTPX."
HOMEPAGE="
	https://github.com/florimondmanca/httpx-sse
	https://pypi.org/project/httpx-sse/
"
SRC_URI="https://files.pythonhosted.org/packages/4c/60/8f4281fa9bbf3c8034fd54c0e7412e66edbab6bc74c4996bd616f8d0406e/${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha amd64 arm arm64 hppa ~loong ~mips ppc ppc64 ~riscv ~s390 sparc x86"

RDEPEND="
	dev-python/httpcore[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

src_unpack() {
	unpack ${A}
	echo ${P}
	mv ${P} httpx_sse-${PV}
}
