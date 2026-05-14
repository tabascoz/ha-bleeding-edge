# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )
PYPI_NO_NORMALIZE=1
PYPI_PN="swagger-ui-py"

inherit distutils-r1 pypi

DESCRIPTION="Swagger UI for Python web frameworks (Flask, Tornado, Sanic, aiohttp, Quart, Falcon, etc.)"
HOMEPAGE="https://github.com/PWZER/swagger-ui-py"
SRC_URI="$(pypi_wheel_url --unpack)"
S="${WORKDIR}"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    dev-python/flask
	app-arch/unzip
"

# No runtime dependencies are strictly required (it's mostly static assets + helpers),
# but flask is commonly used and pulled in by many users.

python_prepare_all() {
    # === Fix missing [build-system] section (same as aioacaia) ===
    cat >> pyproject.toml <<- EOF || die
	[build-system]
	requires = ["setuptools >= 68.0"]
	build-backend = "setuptools.build_meta"
EOF

    distutils-r1_python_prepare_all
}

distutils_enable_tests pytest
