# Copyright 1999-2026 Open Source Robotics Foundation, Inc.
# Distributed under the terms of the BSD License

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="Docstring style checker"
HOMEPAGE="https://github.com/PyCQA/pydocstyle"

SRC_URI="https://github.com/PyCQA/${PN}/archive/${PV}.tar.gz"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~alpha ~amd64 ~arm ~arm64 ~hppa ~ia64 ~mips ~ppc ~ppc64 ~x86"

RDEPEND="
	dev-python/snowballstemmer
	dev-python/six
"
DEPEND="${RDEPEND}"

distutils_enable_tests pytest
