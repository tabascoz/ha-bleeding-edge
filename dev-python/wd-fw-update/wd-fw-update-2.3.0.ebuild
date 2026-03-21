# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Firmware update tool for Western Digital SSDs on Linux (Ubuntu/Linux Mint focused)"
HOMEPAGE="https://pypi.org/project/wd-fw-update/
    https://github.com/not-a-feature/wd_fw_update"
#SRC_URI="https://files.pythonhosted.org/packages/source/${PN:0:1}/${PN}/${P}.tar.gz"

LICENSE="GPL-3+"
SLOT="0"
KEYWORDS="~amd64 ~x86"  # Adjust as needed; primarily x86_64 tested

RDEPEND="
    >=dev-python/requests-2.25[${PYTHON_USEDEP}]
    >=dev-python/click-8.0[${PYTHON_USEDEP}]
    >=dev-python/rich-10.0[${PYTHON_USEDEP}]
    dev-python/inquirer[${PYTHON_USEDEP}]
    sys-apps/nvme-cli
"

# Optional: if you want to run tests (requires pytest + extras)
# BDEPEND="test? ( dev-python/pytest[${PYTHON_USEDEP}] )"
# RESTRICT="!test? ( test )"

distutils_enable_tests pytest  # Uncomment if you add test deps and want ebuild tests

src_prepare() {
    default

    # Optional: silence deprecation warnings or patch if needed (rarely required)
    # sed -i 's/from openvino.runtime/from openvino/g' ...  # example if relevant
}

pkg_postinst() {
    elog "wd-fw-update requires root privileges to update firmware."
    elog "Run it as: sudo wd-fw-update"
    elog ""
    elog "Make sure nvme-cli is installed and working:"
    elog "    emerge --ask sys-block/nvme-cli"
    elog ""
    elog "Usage example:"
    elog "    sudo wd-fw-update          # interactive mode"
    elog "    sudo wd-fw-update --info   # show drive info"
    elog "    sudo wd-fw-update -m       # manual mode (bypasses safety checks)"
    elog ""
    ewarn "Firmware updates carry risk of data loss or bricking the drive."
    ewarn "Always back up important data first. Use at your own risk."
    ewarn "This tool is beta and not officially supported by Western Digital."
}
