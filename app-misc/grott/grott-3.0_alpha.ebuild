# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# Grott is an application, so we use python-single-r1
PYTHON_COMPAT=( python3_{12..14} )
inherit git-r3 python-single-r1 systemd

DESCRIPTION="Growatt inverter monitor / datalogger"
HOMEPAGE="https://github.com/johanmeijer/grott"

# Target the specific branch requested
EGIT_REPO_URI="https://github.com/johanmeijer/grott.git"
EGIT_BRANCH="Alpha"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"

IUSE="influxdb mqtt systemd"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

# Python dependencies
# Added requests as it is a core dependency of grott
RDEPEND="
    ${PYTHON_DEPS}
    $(python_gen_cond_dep '
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/pyserial[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	influxdb? ( dev-python/influxdb[${PYTHON_USEDEP}] )
	mqtt? ( dev-python/paho-mqtt[${PYTHON_USEDEP}] )
    ')
"
DEPEND="${RDEPEND}"

src_install() {
    # Install application files to /opt/grott
    insinto /opt/grott
    doins -r *

    exeinto /opt/grott
    doexe grott.py

    dosym ../../opt/grott/grott.py /usr/bin/grott

    insinto /etc/grott
    newins examples/grott.ini grott.ini.example  

    if use systemd; then
	# Copy to a temporary directory to be modified
	cp "${FILESDIR}/${PN}.service" "${T}/${PN}.service" || die

	sed -i -e "s|/usr/bin/python|${PYTHON}|" "${T}/${PN}.service" || die

	# If mqtt is enabled, uncomment mosquitto requirement
	if use mqtt; then
	    sed -i -e 's/^#Wants=mosquitto.service/Wants=mosquitto.service/' \
	           "${T}/${PN}.service" || die
	fi

	# If influxdb is enabled, uncomment influxdb requirements
	if use influxdb; then
	    sed -i -e 's/^#Wants=influxdb.service/Wants=influxdb.service/' \
	           -e 's/^#After=influxdb.service/After=influxdb.service/' \
	           "${T}/${PN}.service" || die
	fi

	# Install the final parsed unit file
	systemd_newunit "${T}/${PN}.service" "${PN}.service"
    fi
}

pkg_postinst() {
    elog "Grott has been installed to /opt/grott."
    elog "An example configuration file has been placed in /etc/grott/grott.ini.example."
    elog ""
    elog "Copy it to grott.ini and configure it before starting the service:"
    elog "  cp /etc/grott/grott.ini.example /etc/grott/grott.ini"
}