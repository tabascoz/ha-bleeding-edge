# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=standalone
PYTHON_COMPAT=( python3_{11..14} )
#PYPI_NO_NORMALIZE=1
inherit distutils-r1 pypi

DESCRIPTION="A Python sdk for Tuya Open API, which provides IoT capabilities, maintained by Tuya official"
HOMEPAGE="https://github.com/tuya/tuya-device-sharing-sdk https://pypi.org/project/tuya-device-sharing-sdk/"
SRC_URI="$(pypi_wheel_url)"
S=${WORKDIR}

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

#DOCS="README.md"

src_prepare() {
	echo -ne "requests
paho-mqtt
" > requirements.txt
	eapply_user
}

#src_unpack() {
#	unpack ${A}
#	echo ${P}
#	mv tuya_device_sharing_sdk-${PV}-py3-none-any.whl  ${P}-${PV}--py3-none-any.whl
#}

RDEPEND="dev-python/paho-mqtt[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]"

python_compile() {
	distutils_wheel_install "${BUILD_DIR}/install" "${DISTDIR}/tuya_device_sharing_sdk-${PV}-py3-none-any.whl"
}
