# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{12..14} )

inherit pypi distutils-r1

DESCRIPTION="OpenTelemetry FastAPI Instrumentation"
HOMEPAGE="
	https://github.com/open-telemetry/opentelemetry-python-contrib
	https://pypi.org/project/opentelemetry-instrumentation-fastapi/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

OTIO_MAJOR_VER="1.45"
OTIO_VER="${OTIO_MAJOR_VER}.$(ver_cut 4)"

RDEPEND="
	~dev-python/opentelemetry-api-${OTIO_VER}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-instrumentation-${PV}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-instrumentation-asgi-${PV}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-semantic-conventions-${OTIO_VER}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-util-http-${PV}[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/fastapi[${PYTHON_USEDEP}]
		~dev-python/opentelemetry-sdk-${OTIO_VER}[${PYTHON_USEDEP}]
		~dev-python/opentelemetry-test-utils-${OTIO_VER}[${PYTHON_USEDEP}]
		dev-python/starlette[${PYTHON_USEDEP}]
	)
"

EPYTEST_DESELECT=(
	# FIXME
	tests/test_fastapi_instrumentation.py::TestFastAPIManualInstrumentation::test_sub_app_fastapi_call
	tests/test_fastapi_instrumentation.py::TestFastAPIManualInstrumentation::test_uninstrument_app
	tests/test_fastapi_instrumentation.py::TestFastAPIManualInstrumentation::test_uninstrument_app_after_instrument
	tests/test_fastapi_instrumentation.py::TestFastAPIFallback::test_no_instrumentation
	tests/test_fastapi_instrumentation.py::TestFastAPIHostHeaderURL::test_sub_app_fastapi_call
	tests/test_fastapi_instrumentation.py::TestFastAPIHostHeaderURLNewSemconv::test_sub_app_fastapi_call
	tests/test_fastapi_instrumentation.py::TestFastAPIHostHeaderURLBothSemconv::test_sub_app_fastapi_call
)
EPYTEST_PLUGINS=()
distutils_enable_tests pytest