# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 toolchain-funcs

PYPI_PN="pydevd"

TAG="pydev_debugger_${PV//./_}"
MY_P="PyDev.Debugger-${TAG}"
DESCRIPTION="PyDev.Debugger (used in PyDev, PyCharm and VSCode Python)"
HOMEPAGE="
	https://github.com/fabioz/PyDev.Debugger/
	https://pypi.org/project/pydevd/
"
SRC_URI="
	https://github.com/fabioz/PyDev.Debugger/archive/${TAG}.tar.gz
		-> ${MY_P}.gh.tar.gz
"
S=${WORKDIR}/${MY_P}

LICENSE="EPL-1.0"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~loong ~m68k ~mips ~ppc ~ppc64 ~riscv ~s390 ~sparc ~x86"

RDEPEND="
	dev-debug/gdb
"
BDEPEND="
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/untangle[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
EPYTEST_RERUNS=5
EPYTEST_XDIST=1
distutils_enable_tests pytest

python_prepare_all() {
	distutils-r1_python_prepare_all

	# Drop -O3 and -flto compiler args
	# Make extension build failures fatal
	sed -i \
		-e 's/extra_link_args = extra_compile_args\[\:\]/pass/g' \
		-e '/extra_compile_args/d' \
		-e '/except/a\    raise' \
		setup.py || die

	# Disable tests incompatible with new package versions
	sed -e '/TEST_\(DJANGO\|FLASK\)/s:True:False:' \
		-i tests_python/debug_constants.py || die

	# Clean up some prebuilt files
	rm -r third_party || die
	cd pydevd_attach_to_process || die

	# Remove these Windows files
	rm attach_{amd64,x86}.dll || die
	rm inject_dll_{amd64,x86}.exe || die
	rm run_code_on_dllmain_{amd64,x86}.dll || die
	rm -r windows winappdbg || die

	# Remove these MacOS files
	rm attach_x86_64.dylib || die

	# Remove these prebuilt linux files
	rm attach_linux_{amd64,x86}.so || die

	cd linux_and_mac || die
	rm compile_mac.sh || die
}

src_compile() {
	pushd pydevd_attach_to_process/linux_and_mac || die
	# recompile removed file (extracted from compile_linux.sh)
	$(tc-getBUILD_CXX) ${CXXFLAGS} ${CPPFLAGS} \
		-o "../attach_linux_${ARCH}.so" \
		${LDFLAGS} -nostartfiles attach.cpp -ldl || die
	popd || die

	distutils-r1_src_compile

	# C extensions
	rm -r _pydevd* || die
}

python_install_all() {
	distutils-r1_python_install_all
	# Remove this duplicate that is installed directly to /usr/
	# These files are also correctly installed to the python site-packages dir
	rm -r "${ED}/usr/pydevd_attach_to_process" || die
}
