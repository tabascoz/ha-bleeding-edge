# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="Find the vendor for a given MAC address"
HOMEPAGE="https://github.com/bauerj/mac_vendor_lookup \
	https://pypi.org/project/mac-vendor-lookup/"
SRC_URI="$(pypi_wheel_url)"

#S="${WORKDIR}/${MY_PN}-${COMMIT}"
S=${WORKDIR}

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

#src_prepare() {
#	xzcat "${DISTDIR}/mac-vendors-${PV}.txt.xz" > "${S}/mac-vendors.txt" || die
#	eapply_user
#}
python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" \
		"${DISTDIR}/mac_vendor_lookup-${PV}-py3-none-any.whl"
}

distutils_enable_tests pytest
