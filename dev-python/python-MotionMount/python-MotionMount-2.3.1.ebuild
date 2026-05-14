# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

HOMEPAGE="https://github.com/vogelsproducts/python-MotionMount https://pypi.org/project/python-MotionMount/"
DESCRIPTION="Control your MotionMount Signature TVM7675 Pro using Python"
SRC_URI="$(pypi_wheel_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

distutils_enable_tests pytest
