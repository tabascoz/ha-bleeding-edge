# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="The AWS SDK for Python"
HOMEPAGE="https://github.com/boto/boto3/ https://pypi.org/project/boto3/"
SRC_URI="
	https://github.com/boto/boto3/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 ~loong ppc ppc64 ~riscv sparc x86"

# botocore: upstream caps below 1.44.0; both hosts already run 1.44.9 and step 12 allows zero
# downgrades, so the bound is raised to 1.45. A deliberate, recorded deviation from
# upstream metadata, measured 2026-11-26 for 2026.12.0_beta0.
RDEPEND="
	>=dev-python/botocore-${PV}[${PYTHON_USEDEP}]
	<dev-python/botocore-1.45[${PYTHON_USEDEP}]
	>=dev-python/jmespath-0.7.1[${PYTHON_USEDEP}]
	<dev-python/jmespath-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/s3transfer-0.19.0[${PYTHON_USEDEP}]
	<dev-python/s3transfer-0.20.0[${PYTHON_USEDEP}]
"

EPYTEST_XDIST=1
distutils_enable_tests pytest

python_prepare_all() {
	# don't lock versions to narrow ranges
	sed -e '/botocore/ d' \
		-e '/jmespath/ d' \
		-e '/s3transfer/ d' \
		-i setup.py || die

	# do not rely on bundled deps in botocore (sic!)
	find . -name '*.py' -exec sed -i \
		-e 's:from botocore[.]vendored import:import:' \
		-e 's:from botocore[.]vendored[.]:from :' \
		{} + || die

	distutils-r1_python_prepare_all
}

python_test() {
	local -x PYTEST_DISABLE_PLUGIN_AUTOLOAD=1
	epytest tests/{functional,unit}
}