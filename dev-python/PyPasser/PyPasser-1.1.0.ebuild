# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python library for solving captchas (Google reCaptcha, Cloudflare Turnstile, GeeTest, Lemin Cropped, Arvancloud ARCaptcha) and clearing anti-bot challenges (Cloudflare, ArvanCloud) via pure HTTP requests and browser automation."
HOMEPAGE="https://github.com/xHossein/PyPasser https://pypi.org/project/PyPasser/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	>=dev-python/httpx-0.27[${PYTHON_USEDEP}]
	>=dev-python/cryptography-41[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		>=dev-python/pytest-8.0[${PYTHON_USEDEP}]
		>=dev-python/pytest-asyncio-0.23[${PYTHON_USEDEP}]
		>=dev-python/respx-0.21[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest