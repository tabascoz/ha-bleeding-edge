# Copyright 1999-2022 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
#PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
DESCRIPTION="CircuitPython APIs for non-CircuitPython versions of Python such as CPython on Linux and MicroPython."
HOMEPAGE="https://github.com/adafruit/Adafruit_Blinka https://pypi.org/project/Adafruit-Blinka/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
	>=dev-python/adafruit-platformdetect-3.70.1[${PYTHON_USEDEP}]
	>=dev-python/adafruit-pureio-1.1.7[${PYTHON_USEDEP}]
	>=dev-python/binho-host-adapter-0.1.6[${PYTHON_USEDEP}]
	>=dev-python/pyftdi-0.40.0[${PYTHON_USEDEP}]
	dev-python/adafruit-circuitpython-typing[${PYTHON_USEDEP}]
	>=dev-python/sysv-ipc-1.1.0[${PYTHON_USEDEP}]
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