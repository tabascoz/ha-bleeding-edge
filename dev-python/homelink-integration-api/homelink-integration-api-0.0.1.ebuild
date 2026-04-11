# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="API to interact with Homelink cloud for MQTT-enabled smart home platforms"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="None"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/python-decouple-3.8[${PYTHON_USEDEP}]
	dev-python/boto3[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
	)
"