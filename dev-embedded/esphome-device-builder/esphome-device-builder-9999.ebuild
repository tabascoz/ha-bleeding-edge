# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_SINGLE_IMPL=1
PYPI_NO_NORMALIZE=1
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 systemd

DESCRIPTION="ESPHome device builder backend"

HOMEPAGE="https://github.com/esphome/esphome-device-builder https://pypi.org/project/esphome-device-builder/"


if [[ ${PV} == *9999* ]]; then
    inherit git-r3
    EGIT_REPO_URI="https://github.com/esphome/device-builder.git"
    EGIT_BRANCH="main"
    S="${WORKDIR}/${P}/"
	# keywords are deliberately EMPTY on this live (9999) branch: a moving upstream snapshot
	# must not be reachable by keyword, or portage could install whatever that tree holds that
	# day and any package naming it in a dependency would drag an unpinnable tree in. The
	# assignment is written rather than omitted so the intent is in the file: portage treats
	# both the same (an explicit request answers `masked by: missing keyword` even for the
	# master's own `KEYWORDS=""` live efiles - measured 2026-10-29 on this tree and on
	# gentoo/app-portage/hackport/hackport-9999.ebuild:19) - and the gentoo master writes
	# this same form in 40 of its live efiles. What the form does buy is the guarantee above:
	# unstable markers (`~amd64 ~arm64`) would keep the snapshot selectable, which is what
	# someone wanted to avoid. Stable markers here would also be wrong in kind (step 10's rule).
	KEYWORDS=""
else
    inherit pypi
    SRC_URI="$(pypi_sdist_url "${PN}" "${PV}")"
    S="${WORKDIR}/esphome_device_builder-${PV}/"
    KEYWORDS="~amd64 ~arm64 "
fi


SLOT="0"
LICENSE="Apache-2.0"

IUSE="+systemd test "
RESTRICT="!test? ( test )"

DEPEND="$(python_gen_cond_dep '
        ~dev-embedded/esphome-device-builder-frontend-0.1.168[${PYTHON_USEDEP}]
        >=dev-python/cryptography-48.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-asyncmdnsresolver-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/colorlog-6.8.0[${PYTHON_USEDEP}]
	>=dev-python/fnv-hash-fast-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/ifaddr-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0.0[${PYTHON_USEDEP}]
	~dev-python/ruamel-yaml-0.19.1[${PYTHON_USEDEP}]
	>=dev-python/voluptuous-0.13.1[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.20[${PYTHON_USEDEP}]
	dev-python/uv
')"

RDEPEND="${DEPEND}"


src_unpack() {
    if [[ -z "${SRC_URI}" ]]; then
	git-r3_src_unpack
    else
	default
    fi
}


src_install() {
    distutils-r1_src_install

    keepdir /var/lib/esphome
    fowners esphome:esphome /var/lib/esphome
    fperms 0750 /var/lib/esphome

    if use systemd; then
        systemd_dounit "${FILESDIR}/${PN}.service"
    fi
}
