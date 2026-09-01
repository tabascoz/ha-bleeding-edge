# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYPI_VERIFY_REPO=https://github.com/tox-dev/tox
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="virtualenv-based automation of test activities"
HOMEPAGE="
	https://tox.readthedocs.io/
	https://github.com/tox-dev/tox/
	https://pypi.org/project/tox/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/cachetools-7.0.3[${PYTHON_USEDEP}]
	>=dev-python/colorama-0.4.6[${PYTHON_USEDEP}]
	>=dev-python/filelock-3.25[${PYTHON_USEDEP}]
	>=dev-python/packaging-26[${PYTHON_USEDEP}]
	>=dev-python/platformdirs-4.9.4[${PYTHON_USEDEP}]
	>=dev-python/pluggy-1.6[${PYTHON_USEDEP}]
	>=dev-python/pyproject-api-1.10[${PYTHON_USEDEP}]
	>=dev-python/python-discovery-1.4.4[${PYTHON_USEDEP}]
	>=dev-python/tomli-w-1.2[${PYTHON_USEDEP}]
	>=dev-python/virtualenv-21.1[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/typing-extensions-4.15[${PYTHON_USEDEP}]
	' 3.12)
"
BDEPEND="
	dev-python/docutils[${PYTHON_USEDEP}]
	dev-python/hatch-vcs[${PYTHON_USEDEP}]
	test? (
		dev-python/argcomplete[${PYTHON_USEDEP}]
		dev-python/build[${PYTHON_USEDEP}]
		dev-python/distlib[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/re-assert[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( pytest-{mock,rerunfailures,timeout,xdist} time-machine )
EPYTEST_RERUNS=3
# upstream timeouts are quite short
: ${EPYTEST_TIMEOUT:=180}
# xdist seems to mess up state between successive implementation runs
distutils_enable_tests pytest

src_prepare() {
	# upstream lower bounds are meaningless
	sed -i -e 's:>=[0-9.]*::' pyproject.toml || die
	distutils-r1_src_prepare
}

python_test() {
	# devpi_process is not packaged, and has lots of dependencies
	cat > "${T}"/devpi_process.py <<-EOF || die
		def IndexServer(*args, **kwargs): raise NotImplementedError()
	EOF

	local -x PYTHONPATH=${T}:${PYTHONPATH}
	local EPYTEST_DESELECT=(
		# Internet
		tests/tox_env/python/virtual_env/package/test_package_cmd_builder.py::test_build_wheel_external
		tests/tox_env/python/virtual_env/package/test_package_cmd_builder.py::test_run_installpkg_targz
		tests/tox_env/python/virtual_env/package/test_package_pyproject.py::test_pyproject_installpkg_pep517_envs
		# require tombi
		tests/session/cmd/test_schema.py::test_schema_tombi_lint
	)
	local EPYTEST_IGNORE=(
		# requires devpi*
		tests/test_provision.py
	)

	epytest -o addopts=
}