# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Tesla vehicle-command, fleet-telemetry and energy protobuf bindings for Python"
HOMEPAGE="https://pypi.org/project/tesla-protocol/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/protobuf-6.33.5[${PYTHON_USEDEP}]
	<dev-python/protobuf-8[${PYTHON_USEDEP}]
	>=dev-python/googleapis-common-protos-1.60[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
distutils_enable_tests pytest