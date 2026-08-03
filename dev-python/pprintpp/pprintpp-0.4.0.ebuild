# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A drop-in replacement for pprint that's actually pretty"
HOMEPAGE="https://github.com/wolever/pprintpp https://pypi.org/project/pprintpp/"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

src_prepare() {
    default
    local tmpfile="${T}/u-mode-fix.patch"
    cat > "${tmpfile}" <<'EOF'
--- a/setup.py
+++ b/setup.py
@@ -8,7 +8,7 @@ import os
 os.chdir(os.path.dirname(sys.argv[0]) or ".")
 
 try:
-    long_description = open("README.rst", "U").read()
+    long_description = open("README.rst", "r", encoding="UTF-8").read()
 except IOError:
     long_description = "See https://github.com/wolever/pprintpp"
EOF
    eapply "${tmpfile}"
}

distutils_enable_tests pytest