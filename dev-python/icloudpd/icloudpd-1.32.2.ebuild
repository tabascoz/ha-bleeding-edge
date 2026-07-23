#Copyright 1999-2025 Gentoo Authors
#Distributed under the terms of the GNU General Public License v2

EAPI=8
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )
inherit distutils-r1 pypi
DESCRIPTION="A command-line tool to download all your iCloud photos"
HOMEPAGE="https://github.com/icloud-photos-downloader/icloud_photos_downloader https://pypi.org/project/icloudpd/"
SRC_URI="https://codeload.github.com/icloud-photos-downloader/icloud_photos_downloader/tar.gz/refs/tags/v${PV} -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
    dev-python/requests[${PYTHON_USEDEP}]
    dev-python/schema[${PYTHON_USEDEP}]
    dev-python/tqdm[${PYTHON_USEDEP}]
    dev-python/piexif[${PYTHON_USEDEP}]
    dev-python/urllib3[${PYTHON_USEDEP}]
    dev-python/typing-extensions[${PYTHON_USEDEP}]
    dev-python/flask[${PYTHON_USEDEP}]
    dev-python/waitress[${PYTHON_USEDEP}]
    dev-python/tzlocal[${PYTHON_USEDEP}]
    dev-python/pytz[${PYTHON_USEDEP}]
    dev-python/certifi[${PYTHON_USEDEP}]
    dev-python/keyring[${PYTHON_USEDEP}]
    dev-python/keyrings-alt[${PYTHON_USEDEP}]
    dev-python/srp[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"


S="${WORKDIR}/icloud_photos_downloader-${PV}"