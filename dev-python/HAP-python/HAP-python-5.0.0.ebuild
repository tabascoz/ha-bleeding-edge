# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( pypy3_11 python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="HomeKit Accessory Protocol implementation in python"
HOMEPAGE="https://github.com/ikalchev/HAP-python https://pypi.org/project/HAP-python/"
SRC_URI="https://github.com/ikalchev/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="qrcode test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/chacha20poly1305-reuseable[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.11.8[${PYTHON_USEDEP}]
	>=dev-python/zeroconf-0.36.2[${PYTHON_USEDEP}]
	dev-python/h11[${PYTHON_USEDEP}]
	qrcode? (
		dev-python/base36[${PYTHON_USEDEP}]
		dev-python/pyqrcode[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
	)
"


distutils_enable_tests pytest

