# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

# PyPI publishes this release as 0.66b2; a Portage version may not carry a bare
# "b" suffix, so the ebuild is named 0.66_beta2 and pypi.eclass maps _beta -> b
# when it builds the sdist URL (measured: the Manifest of the sibling
# opentelemetry-instrumentation-fastapi-0.66_beta2 lists ..._fastapi-0.66b2.tar.gz).
inherit distutils-r1 pypi

DESCRIPTION="Web util for OpenTelemetry"
HOMEPAGE="
	https://github.com/open-telemetry/opentelemetry-python-contrib
	https://pypi.org/project/opentelemetry-util-http/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

OTIO_MAJOR_VER="1.45"
OTIO_VER="${OTIO_MAJOR_VER}.$(ver_cut 4)"

BDEPEND="
	test? (
	=dev-python/opentelemetry-semantic-conventions-0.66_beta2[${PYTHON_USEDEP}]
		~dev-python/opentelemetry-test-utils-${OTIO_VER}[${PYTHON_USEDEP}]
		~dev-python/opentelemetry-api-${OTIO_VER}[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest