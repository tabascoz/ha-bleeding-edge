# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi

DESCRIPTION="Parsers for the ONVIF events protocol"
HOMEPAGE="https://github.com/openvideolibs/onvif-parsers https://onvif-parsers.readthedocs.io"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~ppc64 ~riscv ~x86"
IUSE=""

RDEPEND=""
BDEPEND="
"

distutils_enable_tests pytest

# If the package has no runtime dependencies (common for pure parser libs),
# the RDEPEND line can stay empty.

# pkg_postinst() / pkg_postrm() not needed unless it installs systemd units, udev rules, etc.
