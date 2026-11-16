# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# predbat is a single application (not a library); use python-singleton-r1.
PYTHON_COMPAT=( python3_{12..14} )
inherit python-single-r1 systemd

DESCRIPTION="Home battery prediction and charging automation for Home Assistant"
HOMEPAGE="https://github.com/springfall2008/batpred"

# batpred provides the predbat core (*.py files under apps/predbat/).
# predbat_addon provides rootfs/hass.py — the standalone AppDaemon-like
# launcher that loads predbat.py and runs the main loop without Home Assistant.
BATPEN_TAG="v${PV}"
SRC_URI="
    https://github.com/springfall2008/batpred/archive/refs/tags/${BATPEN_TAG}.tar.gz
        -> ${P}.tar.gz
"
#    https://github.com/springfall2008/predbat_addon/archive/refs/heads/main.tar.gz
#        -> ${PN}-addon-9999.tar.gz


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="+systemd"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# Runtime deps: user/group + Python packages from batpred/requirements.txt
# plus the extra packages the standalone launcher pulls in (aiofiles, pyyaml).
RDEPEND="
    ${PYTHON_DEPS}
    acct-user/predbat
    acct-group/predbat
    $(python_gen_cond_dep '
        dev-python/aiohttp[${PYTHON_USEDEP}]
        dev-python/aiomqtt[${PYTHON_USEDEP}]
        dev-python/aiofiles[${PYTHON_USEDEP}]
        dev-python/matplotlib[${PYTHON_USEDEP}]
        dev-python/numpy[${PYTHON_USEDEP}]
        dev-python/prometheus-client[${PYTHON_USEDEP}]
        dev-python/protobuf[${PYTHON_USEDEP}]
        dev-python/pyjwt[${PYTHON_USEDEP}]
        dev-python/pytz[${PYTHON_USEDEP}]
        dev-python/requests[${PYTHON_USEDEP}]
        dev-python/ruamel-yaml[${PYTHON_USEDEP}]
        dev-python/pyyaml[${PYTHON_USEDEP}]
    ')
    systemd? ( sys-apps/systemd )
"
DEPEND="${RDEPEND}"
BDEPEND="app-arch/unzip"

# batpred extracts to batpred-${PV} (the version tag is "v8.46.5"
# but GitHub strips the leading "v" from the tarball top-level dir).
S="${WORKDIR}/batpred-${PV}"
#ADDON_S="${WORKDIR}/batpred-${PV}/apps/predbat"

# Application dir (read-only code) and home/config dir.
APP_DIR="/usr/share/predbat"
CFG_DIR="/var/lib/predbat"

#src_configure() { :; }

src_prepare() {
    default

    # Patch CONFIG_ROOTS so predbat writes to /var/lib/predbat
    # instead of the Docker-centric /config.
    sed -i \
        -e 's|^CONFIG_ROOTS = \[.*\]$|CONFIG_ROOTS = ["/var/lib/predbat", "/config", "/conf", "/homeassistant", "./"]|' \
        apps/predbat/const.py \
        || die "Failed to patch CONFIG_ROOTS"

    grep -q '"/var/lib/predbat"' apps/predbat/const.py \
        || die "CONFIG_ROOTS patch verification failed"
}

#src_compile() { :; }

src_install() {
    # ---------------------------------------------------------------
    # 1. Install predbat core: all .py files from batpred/apps/predbat/
    # ---------------------------------------------------------------
    insinto "${APP_DIR}"
    doins apps/predbat/*.py

    # ---------------------------------------------------------------
    # 1b. Install the pre-built C++ prediction kernel binaries.
    #     These ship in the repo (one per architecture), produced by
    #     the kernel-binaries CI job. predbat's prediction_kernel.py
    #     selects the correct one at runtime via platform.machine().
    # ---------------------------------------------------------------
    local so
    for so in apps/predbat/prediction_kernel_lib_*.so; do
        [[ -e "${so}" ]] && doins "${so}"
    done


    # ---------------------------------------------------------------
    # 2. Install the standalone launcher (hass.py) from predbat_addon
    # ---------------------------------------------------------------
#    if [[ ! -f "${ADDON_S}/rootfs/hass.py" ]]; then
#        die "hass.py not found in predbat_addon rootfs"
#    fi
    doins apps/predbat/hass.py

    # Make hass.py executable (the upstream rootfs ships it executable).
    fperms 0755 "${APP_DIR}/hass.py"

    # ---------------------------------------------------------------
    # 3. Install the apps.yaml template into the config dir
    # ---------------------------------------------------------------
    keepdir "${CFG_DIR}"
    keepdir "${CFG_DIR}/logs"

    if [[ -f apps/predbat/config/apps.yaml ]]; then
        insinto "${CFG_DIR}"
        newins apps/predbat/config/apps.yaml apps.yaml.example
    fi

    # ---------------------------------------------------------------
    # 4. Install the predbat wrapper script in /usr/bin
    # ---------------------------------------------------------------
    exeinto /usr/bin
    newexe - predbat <<-'EOF'
        #!/bin/sh
        # Wrapper: chdir to the predbat config dir and exec the standalone
        # hass.py launcher. All Python imports in predbat are flat-file
        # imports, so the application directory is added to PYTHONPATH.
        cd /var/lib/predbat || exit 1
        export PYTHONPATH="/usr/share/predbat${PYTHONPATH+:${PYTHONPATH}}"
        exec python3 /usr/share/predbat/hass.py "$@"
	EOF

    # ---------------------------------------------------------------
    # 5. Fix ownership of the config dir + template
    # ---------------------------------------------------------------
    fowners predbat:predbat \
        "${CFG_DIR}" \
        "${CFG_DIR}/logs"

    if [[ -f apps/predbat/config/apps.yaml ]]; then
        fowners predbat:predbat "${CFG_DIR}/apps.yaml.example"
        fperms 0640             "${CFG_DIR}/apps.yaml.example"
    fi

    # The application directory is read-only code; root-owned is fine.
    # ---------------------------------------------------------------
    # 6. systemd unit (gated by USE=systemd)
    # ---------------------------------------------------------------
    if use systemd; then
        systemd_dounit "${FILESDIR}/predbat.service"
    fi

    # ---------------------------------------------------------------
    # 7. Simple envd-style doc
    # ---------------------------------------------------------------
    dodoc docs/install.md
}

pkg_postinst() {
    elog ""
    elog "Predbat has been installed to /usr/share/predbat"
    elog "Configuration directory: /var/lib/predbat"
    elog ""
    elog "To get started:"
    elog "  1. cp /var/lib/predbat/apps.yaml.example /var/lib/predbat/apps.yaml"
    elog "  2. Edit /var/lib/predbat/apps.yaml and set 'ha_url' and 'ha_key'"
    elog "     (see https://springfall2008.github.io/batpred/ for the full"
    elog "      apps.yaml reference)."
    elog "  3. Start the service:"
    if use systemd; then
        elog "       systemctl enable --now predbat.service"
    else
        elog "       predbat  (foreground) — write your own init script"
        elog "       or use sys-process/supervisor / sys-process/runit."
    fi
    elog ""
    elog "Logs are written to /var/lib/predbat/predbat.log"
    elog ""
    ewarn "Predbat talks to a running Home Assistant instance."
    ewarn "Make sure Home Assistant is reachable before starting predbat."
}
