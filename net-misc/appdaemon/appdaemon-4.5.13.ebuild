# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Apps for the Home Assistant home automation package"
HOMEPAGE="https://appdaemon.readthedocs.io/
          https://github.com/AppDaemon/appdaemon"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="+server +systemd"


RDEPEND="
    server? ( ~acct-group/appdaemon-0 ~acct-user/appdaemon-0  )

    >=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
    >=dev-python/aiohttp-jinja2-1.5.1[${PYTHON_USEDEP}]
    >=dev-python/astral-3.2[${PYTHON_USEDEP}]
    >=dev-python/bcrypt-4.0.1[${PYTHON_USEDEP}]
    >=dev-python/deepdiff-8.2.0[${PYTHON_USEDEP}]
    >=dev-python/feedparser-6.0.10[${PYTHON_USEDEP}]
    >=dev-python/paho-mqtt-1.6.1[${PYTHON_USEDEP}]
    >=dev-python/pid-3.0.4[${PYTHON_USEDEP}]
    >=dev-python/python-dateutil-2.8.2[${PYTHON_USEDEP}]
    >=dev-python/python-socketio-5.5[${PYTHON_USEDEP}]
    >=dev-python/pytz-2022.7.1[${PYTHON_USEDEP}]
    >=dev-python/pyyaml-6.0.1[${PYTHON_USEDEP}]
    >=dev-python/requests-2.28.2[${PYTHON_USEDEP}]
    >=dev-python/sockjs-0.11[${PYTHON_USEDEP}]
    >=dev-python/tomli-2.2.1[${PYTHON_USEDEP}]
    >=dev-python/tomli-w-1.0[${PYTHON_USEDEP}]
    >=dev-python/pydantic-2.10.6[${PYTHON_USEDEP}]
    >=dev-python/uvloop-0.21.0[${PYTHON_USEDEP}]
"

BDEPEND="
    ${RDEPEND}
"

#src_install() {
#    if ! use server; then
#        return 0
#    fi
#
#    insinto /opt/${PN}

#    if use systemd; then
#        systemd_dounit "${FILESDIR}/${PN}.service"
#    fi

#    if use server; then                                                                                                                                                               
#	keepdir "/var/lib/${PN}"                                                                                                                                                  
#	fowners -R "${PN}:${PN}" "/var/lib/${PN}"                                                                                                                                 
#	fperms -R 0775 "/var/lib/${PN}"
#    fi 

#}

