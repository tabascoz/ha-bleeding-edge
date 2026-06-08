# Copyright 2023 Avishek Sen
# Distributed under the terms of the GNU General Public License v3

EAPI=8

inherit linux-info systemd

DESCRIPTION="NoteBook FanControl ported to Linux"
HOMEPAGE="https://github.com/nbfc-linux/nbfc-linux"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	# EGIT_BRANCH="main"
	EGIT_BRANCH="gentoo"
	EGIT_CLONE_TYPE="shallow"
	# EGIT_REPO_URI="https://github.com/nbfc-linux/${PN}.git"
	EGIT_REPO_URI="https://github.com/x0rzavi/${PN}.git"
else
	RESTRICT="mirror"
	SRC_URI="https://github.com/nbfc-linux/${PN}/archive/${PV}.tar.gz -> ${P}.tar.gz"
	KEYWORDS="-* ~amd64"
fi

LICENSE="GPL-3"
SLOT="0"
IUSE="zsh-completion bash-completion fish-completion"

RDEPEND="sys-apps/dmidecode"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

CONFIG_CHECK="
	ACPI_EC_DEBUGFS
	~HWMON
	X86_MSR
"
WARNING_HWMON="No hardware monitoring support detected!
			   nbfc-linux can not function without temperature
			   monitoring"

QA_PRESTRIPPED="/usr/bin/nbfc_service
			/usr/bin/nbfc
			/usr/bin/ec_probe"

src_compile() {
	if [[ ${PV} == 9999 ]]; then
		emake PREFIX=/usr confdir=/etc sysddir=/lib/systemd/system orcdir=/etc/init.d DESTDIR="${D}"
	else
		emake PREFIX=/usr confdir=/etc sysddir=/lib/systemd/system DESTDIR="${D}"
	fi
}

src_install() {
	if [[ ${PV} == 9999 ]]; then
		emake PREFIX=/usr confdir=/etc sysddir=/lib/systemd/system orcdir=/etc/init.d DESTDIR="${D}" install install-openrc
	else
		emake PREFIX=/usr confdir=/etc sysddir=/lib/systemd/system DESTDIR="${D}" install
		newinitd "${FILESDIR}/nbfc_service.initd" nbfc_service
	fi
	if ! use zsh-completion ; then rm -rf "${D}/usr/share/zsh" || die "Removing unnecessary completions failed!"; fi
	if ! use bash-completion ; then rm -rf "${D}/usr/share/bash-completion" || die "Removing unnecessary completions failed!"; fi
	if ! use fish-completion ; then rm -rf "${D}/usr/share/fish" || die "Removing unnecessary completions failed!"; fi
	einstalldocs
}

pkg_postinst() {
	elog "nbfc-linux requires to monitor temperature sensors."
	elog "Ensure that there is proper support."
	elog " "
	elog "If you wish nbfc_service to get started on boot then,"
	elog "for systemd use 'sudo systemctl enable nbfc_service' or "
	elog "for openrc use 'sudo rc-update add nbfc_service default' "
}
