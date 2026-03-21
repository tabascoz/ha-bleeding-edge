# Copyright 1999-2026 tabascoz
# Distributed under the terms of the GNU General Public License v2
# Created with assistance from Grok (xAI) — https://grok.x.ai
# Thank you Grok for the patient debugging and final clean ebuild ❤️

EAPI=8

inherit linux-mod-r1

DESCRIPTION="MediaTek MT7927/MT6639 WiFi 7 driver - patched mt76 (Liquorix 6.19.5)"
HOMEPAGE="https://github.com/jetm/mediatek-mt7927-dkms"

COMMIT="6afbbf55aa873bc953d389059e0ba3f2788979f1"

SRC_URI="https://github.com/jetm/mediatek-mt7927-dkms/archive/${COMMIT}.tar.gz -> ${PN}-${PV}-${COMMIT}.tar.gz"

S="${WORKDIR}/${PN}-${PV}-${COMMIT}"
MT76_S="${S}/mt76"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

CONFIG_CHECK="~CFG80211 ~MAC80211 ~BT ~BT_HCIBTUSB"

src_unpack() {
    unpack "${A}"

    mkdir -p "${MT76_S}" || die
    cp -a "${KV_DIR}/drivers/net/wireless/mediatek/mt76/." "${MT76_S}/" || die
}

src_prepare() {
    default

    cd "${MT76_S}" || die

    einfo "Using Liquorix kernel: ${KV_FULL}"

    # Your pre-fix (before patches)
    einfo "Pre-fixing mt792x.h"
    sed -i '/#define MT7925_/a\
#define MT7902_FIRMWARE_WM\t"mediatek/WIFI_RAM_CODE_MT7902_1.bin"\
#define MT7902_ROM_PATCH\t"mediatek/WIFI_MT7902_patch_mcu_1_1_hdr.bin"' \
        mt792x.h || ewarn "sed fix skipped"

    einfo "Applying jetm patches..."
    local p
    for p in "${S}"/mt79*.patch "${S}"/*.patch; do
        [[ -f "${p}" ]] && {
            einfo "  → ${p##*/}"
            eapply "${p}" || die "Patch failed: ${p##*/}"
        }
    done

    for frag in "${S}"/mt*.Kbuild; do
        [[ -f "${frag}" ]] && cat "${frag}" >> Kbuild || true
    done
}

src_compile() {
    export ARCH=x86_64
    emake -C "${KV_DIR}" ARCH=x86_64 M="${MT76_S}" modules || die
}

src_install() {
    # Manual install (this fixes the linux-mod-r1 error)
    insinto "/lib/modules/${KV_FULL}/kernel/drivers/net/wireless/mediatek/mt76"
    doins "${MT76_S}"/*.ko

    if [[ -d "${MT76_S}/mt7925" ]]; then
        insinto "/lib/modules/${KV_FULL}/kernel/drivers/net/wireless/mediatek/mt76/mt7925"
        doins "${MT76_S}"/mt7925/*.ko
    fi

    # Firmware extractor
    if [[ -f "${S}/extract_firmware.py" ]]; then
        insinto /usr/share/${PN}
        doins "${S}/extract_firmware.py"
        fperms +x /usr/share/${PN}/extract_firmware.py
        dosym ../share/${PN}/extract_firmware.py /usr/bin/mt7927-extract-firmware
    fi
}

pkg_postinst() {
    linux-mod-r1_pkg_postinst

    elog "✅ MT7927 driver installed against your Liquorix 6.19.5 kernel!"
    elog ""
    elog "Firmware (one-time):"
    elog "  mt7927-extract-firmware /path/to/Windows_driver.exe"
    elog "  sudo cp ~/mediatek-firmware/*.bin /lib/firmware/mediatek/"
    elog ""
    elog "Test it:"
    elog "  sudo modprobe -r mt7925e btusb && sudo modprobe mt7925e"
    elog "  dmesg | grep -E 'mt79|MT7927|mediatek'"
    elog ""
    elog "After kernel upgrade: emerge @module-rebuild"
}