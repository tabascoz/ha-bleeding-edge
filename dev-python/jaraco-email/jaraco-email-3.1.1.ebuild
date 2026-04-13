# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
PYPI_PN=${PN/-/.}
PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="E-mail facilities by jaraco"
HOMEPAGE="https://github.com/jaraco/jaraco.email https://pypi.org/project/jaraco.email/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND=">=dev-python/jaraco-text-1.3[${PYTHON_USEDEP}]
	dev-python/jaraco-collections[${PYTHON_USEDEP}]
	dev-python/keyring[${PYTHON_USEDEP}]
	dev-python/aiosmtpd[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
		>=dev-python/pytest-checkdocs-2.4[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		>=dev-python/pytest-enabler-2.2[${PYTHON_USEDEP}]
		dev-python/pytest-ruff[${PYTHON_USEDEP}]
		>=dev-python/pytest-black-0.3.7[${PYTHON_USEDEP}]
		>=dev-python/pytest-mypy-0.9.1[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest