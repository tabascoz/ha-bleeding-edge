# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..15} )

inherit distutils-r1 pypi

DESCRIPTION="Typing stubs for requests"
HOMEPAGE="
	https://pypi.org/project/types-requests/
	https://github.com/python/typeshed/tree/master/stubs/requests
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND=">=dev-python/urllib3-2[${PYTHON_USEDEP}]"

BDEPEND="test? (
	dev-python/mypy[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
)"

PATCHES=( "${FILESDIR}/${PN}-2.33.0.20260408-pyproject-package-data.patch" )

python_test() {
	# Mirrors typeshed's stubs/requests/@tests/stubtest_allowlist.txt;
	# PyPI's sdist strips @tests/, so the allowlist is inlined here.
	local allowlist="${T}/stubtest_allowlist.txt"
	cat > "${allowlist}" <<-EOF || die
		# Loop variables that leak into the global scope
		requests.packages.mod
		requests.packages.package
		requests.packages.target

		# Should allow setting any attribute:
		requests.structures.LookupDict.__setattr__
	EOF

	MYPYPATH="${S}" "${EPYTHON}" -m mypy.stubtest \
		--allowlist "${allowlist}" requests \
		|| die
}
