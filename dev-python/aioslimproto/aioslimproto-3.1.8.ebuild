# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python module to talk to Logitech Squeezebox players directly (without Logitech server)."
HOMEPAGE="https://github.com/music-assistant/aioslimproto https://pypi.org/project/aioslimproto/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

BDEPEND="
    >=dev-python/aiohttp-3.9.2[${PYTHON_USEDEP}]
    dev-python/pillow[${PYTHON_USEDEP}]
    test? (
        dev-python/codespell-2.4.1[${PYTHON_USEDEP}]
        dev-python/isort-7.0.0[${PYTHON_USEDEP}]
        dev-python/mypy-1.18.2[${PYTHON_USEDEP}]
        dev-python/pre-commit-4.5.1[${PYTHON_USEDEP}]
        dev-python/pre-commit-hooks-6.0.0[${PYTHON_USEDEP}]
        dev-python/pytest-8.4.1[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio-1.3.0[${PYTHON_USEDEP}]
        dev-python/pytest-aiohttp-1.1.0[${PYTHON_USEDEP}]
        dev-python/pytest-cov-7.0.0[${PYTHON_USEDEP}]
        dev-python/ruff-0.12.8[${PYTHON_USEDEP}]
        dev-python/safety-3.6.2[${PYTHON_USEDEP}]
        dev-python/tomli-2.2.1[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest