# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="SensorPush Public API"
HOMEPAGE="https://pypi.org/project/sensorpush-api/"

SRC_URI="$(pypi_sdist_url)"
LICENSE="BSD-2-Clause"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
    >=dev-python/python-dateutil-2.5.3[${PYTHON_USEDEP}]
    >=dev-python/urllib3-1.25.3[${PYTHON_USEDEP}]
    <dev-python/urllib3-3.0.0[${PYTHON_USEDEP}]
    >=dev-python/pydantic-1.10.5[${PYTHON_USEDEP}]
    >=dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
    >=dev-python/setuptools-68.0[${PYTHON_USEDEP}]
    test? (
        >=dev-python/pytest-7.1.3[${PYTHON_USEDEP}]
        <dev-python/pytest-8.0.0[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
        >=dev-python/pytest-randomly-3.12.0[${PYTHON_USEDEP}]
    )
"
python_prepare_all() {
    # Create the missing options.json file with minimal content
    cat > options.json <<- EOF || die
    {
      "version": "${PV}"
    }
EOF

    cat > requirements.txt <<- EOF || die
    requests
EOF

    cat > test-requirements.txt <<- EOF || die
    requests
EOF

    cat > release-requirements.txt <<- EOF || die
    requests
EOF

cat > setup.py <<- EOF || die
from setuptools import setup, find_packages

setup(
        name="sensorpush-api",
        version="${PV}",
        description="Python library for the SensorPush API",
        author="sstallion",
        license="MIT",
        packages=find_packages(),
        install_requires=["requests"],
        python_requires=">=3.8",
)
EOF

    rm -rf test tests || true

    # If setup.py tries to read other fields, we can expand this later
    distutils-r1_python_prepare_all
}

distutils_enable_tests pytest