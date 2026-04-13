# Copyright 1999-2021 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi
#SRC_URI="$(pypi_sdist_url --no-normalize)"
SRC_URI="https://files.pythonhosted.org/packages/source/A/Adafruit_PureIO/Adafruit_PureIO-1.1.11.tar.gz -> ${P}.tar.gz"

DESCRIPTION="Pure python (i.e. no native extensions) access to Linux IO including I2C and SPI. Drop in replacement for smbus and spidev modules."
HOMEPAGE="https://github.com/adafruit/Adafruit_Python_PureIO https://pypi.org/project/Adafruit-PureIO/"

S="${WORKDIR}/Adafruit_PureIO-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest