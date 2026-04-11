# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A package to interact with Anglian Water"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/pyjwt-2.6[${PYTHON_USEDEP}]
	<dev-python/pyjwt-3[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3[${PYTHON_USEDEP}]
	>=dev-python/cryptography-46[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/bandit-1.7[${PYTHON_USEDEP}]
		<dev-python/bandit-1.10[${PYTHON_USEDEP}]
		>=dev-python/black-24[${PYTHON_USEDEP}]
		<dev-python/black-27[${PYTHON_USEDEP}]
		>=dev-python/build-1.1[${PYTHON_USEDEP}]
		<dev-python/build-1.5[${PYTHON_USEDEP}]
		>=dev-python/flake8-7[${PYTHON_USEDEP}]
		<dev-python/flake8-8[${PYTHON_USEDEP}]
		>=dev-python/isort-5[${PYTHON_USEDEP}]
		<dev-python/isort-9[${PYTHON_USEDEP}]
		>=dev-python/mypy-1.9[${PYTHON_USEDEP}]
		<dev-python/mypy-1.20[${PYTHON_USEDEP}]
		>=dev-python/pytest-8[${PYTHON_USEDEP}]
		<dev-python/pytest-10[${PYTHON_USEDEP}]
		>=dev-python/pytest-cov-4[${PYTHON_USEDEP}]
		<dev-python/pytest-cov-8[${PYTHON_USEDEP}]
		>=dev-python/twine-4[${PYTHON_USEDEP}]
		<dev-python/twine-7[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest