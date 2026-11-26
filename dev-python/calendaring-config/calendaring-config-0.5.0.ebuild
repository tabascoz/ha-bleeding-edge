# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=hatchling
inherit pypi distutils-r1

DESCRIPTION="The shared configuration file of caldav, calendaring and calendaring-jmap: format, discovery and credentials"
HOMEPAGE="https://pypi.org/project/${PN}/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="keyring"

RDEPEND="
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	keyring? ( >=dev-python/keyring-25[${PYTHON_USEDEP}] )
"
BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"