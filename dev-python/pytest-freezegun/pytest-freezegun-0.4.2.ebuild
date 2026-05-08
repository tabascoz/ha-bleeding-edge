# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="Wrap tests with fixtures in freeze_time"
HOMEPAGE="https://github.com/ktosiek/pytest-freezegun https://pypi.org/project/pytest-freezegun"

#SRC_URI="$(pypi_wheel_url)"
SRC_URI="https://files.pythonhosted.org/packages/9e/09/0bdd7d24b9d21453ad3364ae1efbd65082045bb6081b5fd5eade91a9b644/pytest_freezegun-0.4.2-py2.py3-none-any.whl"
S=${WORKDIR}

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>dev-python/freezegun-0.3[${PYTHON_USEDEP}]
	>=dev-python/pytest-3.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	>=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_prepare_all() {
    # Fix missing [build-system] section in upstream pyproject.toml
    # This is the root cause of "Unable to obtain build-backend from pyproject.toml"
    cat >> pyproject.toml <<- EOF || die
    [build-system]
    requires = ["setuptools >= 68.0"]
    build-backend = "setuptools.build_meta"
EOF
    
    distutils-r1_python_prepare_all
}

distutils_enable_tests pytest