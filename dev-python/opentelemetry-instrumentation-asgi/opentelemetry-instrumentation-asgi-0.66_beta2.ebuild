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

DESCRIPTION="ASGI instrumentation for OpenTelemetry"
HOMEPAGE="
	https://github.com/open-telemetry/opentelemetry-python-contrib
	https://pypi.org/project/opentelemetry-instrumentation-asgi/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

OTIO_PV="1.45.2"

# opentelemetry-semantic-conventions is published by upstream as 0.66b2 (PyPI has no 1.45.x),
# while ::gentoo names its ebuild after the core release and builds it from the GitHub
# tarball. Two identities in one slot means a slot conflict, so every ebuild in this overlay
# pins the identity this overlay actually provides and has installed - the same form used by
# opentelemetry-sdk-1.45.2 and opentelemetry-instrumentation-0.66_beta2 (measured 2026-11-26:
# the generated pin ~...-1.45.2 pulled ::gentoo's copy against the installed 0.66_beta2).
RDEPEND="
	dev-python/asgiref[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-api-${OTIO_PV}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-instrumentation-${PV}[${PYTHON_USEDEP}]
	=dev-python/opentelemetry-semantic-conventions-0.66_beta2[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-util-http-${PV}[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		~dev-python/opentelemetry-api-${OTIO_PV}[${PYTHON_USEDEP}]
		~dev-python/opentelemetry-sdk-${OTIO_PV}[${PYTHON_USEDEP}]
		~dev-python/opentelemetry-test-utils-${OTIO_PV}[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
distutils_enable_tests pytest