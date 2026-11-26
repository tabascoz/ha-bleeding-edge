# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 pypi

MY_P="opentelemetry-python-${PV}"
DESCRIPTION="Test utilities for OpenTelemetry unit tests"
HOMEPAGE="
	https://opentelemetry.io/
	https://github.com/open-telemetry/opentelemetry-python/
	https://pypi.org/project/opentelemetry-test-utils/
"
SRC_URI="
	https://github.com/open-telemetry/opentelemetry-python/archive/refs/tags/v${PV}.tar.gz
		-> ${MY_P}.gh.tar.gz
"

S="${WORKDIR}/${MY_P}/tests/${PN}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/asgiref[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-api-${PV}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-sdk-${PV}[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest
