# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Python API client for Jellyfin"
HOMEPAGE="https://github.com/iwalton3/jellyfin-apiclient-python https://pypi.org/project/jellyfin-apiclient-python/"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

RDEPEND="dev-python/requests[${PYTHON_USEDEP}]
	dev-python/urllib3[${PYTHON_USEDEP}]
	dev-python/websocket-client[${PYTHON_USEDEP}]
	dev-python/certifi[${PYTHON_USEDEP}]"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_test() {
	py.test -v -v || die
}



python_prepare_all() {
    # Force a clean [build-system] section at the end of pyproject.toml
    # This reliably fixes "Unable to obtain build-backend from pyproject.toml"
    sed -i '/^\[build-system\]/,/^$/d' pyproject.toml || die

    cat >> pyproject.toml <<- 'EOF' || die
            
    [build-system]
    requires = ["setuptools >= 68.0"]
    build-backend = "setuptools.build_meta"
EOF
                            
    # Optional: fix any hardcoded version if present
    sed -i "s/version = [\"']1\.11\.0[\"']/version = \"${PV}\"/" pyproject.toml || true
                
    distutils-r1_python_prepare_all
}
#python_prepare_all() {
    # Fix missing [build-system] section in upstream pyproject.toml
    # This is the root cause of "Unable to obtain build-backend from pyproject.toml"

#    cat >> pyproject.toml <<- EOF || die

#    [build-system]
#    requires = ["setuptools >= 68.0"]
#    build-backend = "setuptools.build_meta"
#EOF
                
#    distutils-r1_python_prepare_all
#}




distutils_enable_tests pytest