# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )

DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Python client for the airtouch 5"
HOMEPAGE="https://pypi.org/project/airtouch5py/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

# the `<crc-9.0.0` bound is a deliberate widening of upstream's own `<crc-8.0.0`: airtouch5py 0.5.1's
# wheel METADATA declares `crc<8.0.0,>=7.1.0`, but this release's closure pins crc>=8.0.0
# (requirements_all.txt:4230) and crc-8.0.0 is installed on both machines, so step 12's no-downgrade
# rule widens the depending atom instead of touching the installed package. Reported, never silent.
RDEPEND=">=dev-python/bitarray-3.4.2[${PYTHON_USEDEP}] \
	<dev-python/bitarray-4.0.0[${PYTHON_USEDEP}] \
	>=dev-python/crc-7.1.0[${PYTHON_USEDEP}] \
	<dev-python/crc-9.0.0[${PYTHON_USEDEP}] "

distutils_enable_tests pytest