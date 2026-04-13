# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Types needed for type annotation that are not in typing"
HOMEPAGE="https://github.com/adafruit/Adafruit_CircuitPython_Typing.git https://pypi.org/project/adafruit-circuitpython-typing/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	dev-python/adafruit-circuitpython-busdevice[${PYTHON_USEDEP}]
	dev-python/adafruit-blinka[${PYTHON_USEDEP}]
	dev-python/adafruit-circuitpython-requests[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest