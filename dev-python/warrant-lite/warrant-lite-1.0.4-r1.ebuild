# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="Small Python library for process SRP requests for AWS Cognito"
HOMEPAGE=" https://pypi.org/project/warrant-lite/"

LICENSE="Apache-2.0"
SLOT="0"
# unstabled here on purpose: the published mirror claimed stable keywords for arm and x86,
# which pkgcheck rejects because this package own dependency (python-jose) is not solvable
# on a stable arm profile. Nothing in this tree claims stable keywords for python packages.
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/boto3-1.9[${PYTHON_USEDEP}]
	>=dev-python/envs-1.3[${PYTHON_USEDEP}]
	>=dev-python/python-jose-3.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.22[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
