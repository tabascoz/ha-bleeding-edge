# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1 pypi

DESCRIPTION="MQTT client/broker using Python asyncio"
HOMEPAGE="https://github.com/Yakifo/amqtt https://pypi.org/project/amqtt/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="ci test"
RESTRICT="!test? ( test )"

DOCS="readme.rst"

RDEPEND="
	>=dev-python/dacite-1.9.2[${PYTHON_USEDEP}]
	=dev-python/passlib-1.7.4[${PYTHON_USEDEP}]
	>=dev-python/psutil-7.0.0[${PYTHON_USEDEP}]
	=dev-python/pyyaml-6.0.2[${PYTHON_USEDEP}]
	=dev-python/transitions-0.9.2[${PYTHON_USEDEP}]
	=dev-python/typer-0.15.4[${PYTHON_USEDEP}]
	=dev-python/websockets-15.0.1[${PYTHON_USEDEP}]
	ci? ( =dev-python/coveralls-4.0.1[${PYTHON_USEDEP}] )
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest