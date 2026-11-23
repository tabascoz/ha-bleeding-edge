# Copyright 2024-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=pdm-backend
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1 optfeature

DESCRIPTION="FastAPI framework, high performance, easy to learn, ready for production"
HOMEPAGE="
	https://fastapi.tiangolo.com/
	https://pypi.org/project/fastapi/
	https://github.com/fastapi/fastapi
"

if [[ ${PV} == 9999 ]]; then
	inherit git-r3
	EGIT_REPO_URI="https://github.com/fastapi/fastapi.git"
else
	inherit pypi
	KEYWORDS="~amd64"
fi

LICENSE="MIT"
SLOT="0"

RDEPEND="
	>=dev-python/annotated-doc-0.0.2[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.1.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/starlette-1.6.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
	>=dev-python/typing-inspection-0.4.2[${PYTHON_USEDEP}]
	>=dev-python/opentelemetry-api-1.44.0[${PYTHON_USEDEP}]
"
# TODO: python3.15 strawberry-graphql
BDEPEND="
	test? (
		dev-python/aiosqlite[${PYTHON_USEDEP}]
		>=dev-python/anyio-3.2.1[${PYTHON_USEDEP}]
		dev-python/argon2-cffi[${PYTHON_USEDEP}]
		<dev-python/a2wsgi-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/a2wsgi-1.9.0[${PYTHON_USEDEP}]
		dev-python/dirty-equals[${PYTHON_USEDEP}]
		dev-python/email-validator[${PYTHON_USEDEP}]
		<dev-python/flask-4.0.0[${PYTHON_USEDEP}]
		>=dev-python/flask-3.0.0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
		>=dev-python/httpx2-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/inline-snapshot-0.21.1[${PYTHON_USEDEP}]
		>=dev-python/jinja2-3.1.5[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-proto-http-1.44.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-sdk-1.44.0[${PYTHON_USEDEP}]
		dev-python/opentelemetry-instrumentation[${PYTHON_USEDEP}]
		dev-python/opentelemetry-instrumentation-fastapi[${PYTHON_USEDEP}]
		>=dev-python/orjson-3.9.3[${PYTHON_USEDEP}]
		>=dev-python/pwdlib-0.2.1[${PYTHON_USEDEP}]
		>=dev-python/pydantic-extra-types-2.0.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-2.0.0[${PYTHON_USEDEP}]
		dev-python/pyjwt[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.18[${PYTHON_USEDEP}]
		>=dev-python/python-slugify-8.0.4[${PYTHON_USEDEP}]
		<dev-python/pyyaml-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-5.3.1[${PYTHON_USEDEP}]
		$(python_gen_cond_dep '
			<dev-python/strawberry-graphql-1.0.0[${PYTHON_USEDEP}]
			>=dev-python/strawberry-graphql-0.200.0[${PYTHON_USEDEP}]
		' python3_{12..14})
		dev-python/sqlmodel[${PYTHON_USEDEP}]
		dev-python/trio[${PYTHON_USEDEP}]
		>=dev-python/typer-0.26.1[${PYTHON_USEDEP}]
		>=dev-python/ujson-5.8.0[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
	)
"
#>=dev-python/sentry-sdk-2.70.0[${PYTHON_USEDEP}]
# brotli and zstd due to starlette based tests expecting it

# Hung once
: ${EPYTEST_TIMEOUT:=60}
EPYTEST_XDIST=1
EPYTEST_PLUGINS=( anyio )
distutils_enable_tests pytest

EPYTEST_DESELECT=(
	# Depends on coverage
	"tests/test_fastapi_cli.py::test_fastapi_cli"
	# Test result affected by unrelated packages such as brotli and zstd
	# https://github.com/fastapi/fastapi/blob/7c6f2f8fde68f488163376c9e92a59d46c491298/tests/test_tutorial/test_header_param_models/test_tutorial001.py#L77
	"tests/test_tutorial/test_header_param_models/test_tutorial001.py::test_header_param_model_invalid"
	"tests/test_tutorial/test_header_param_models/test_tutorial003.py::test_header_param_model_invalid"
	"tests/test_tutorial/test_header_param_models/test_tutorial003.py::test_header_param_model_no_underscore"
	# https://gitweb.gentoo.org/repo/gentoo.git/commit/?id=6afa196ca0cb1604875847b1b84fa64896a06f6e
	"tests/test_multipart_installation.py::test_incorrect_multipart_installed_form"
	"tests/test_multipart_installation.py::test_incorrect_multipart_installed_file_upload"
	"tests/test_multipart_installation.py::test_incorrect_multipart_installed_file_bytes"
	"tests/test_multipart_installation.py::test_incorrect_multipart_installed_multi_form"
	"tests/test_multipart_installation.py::test_incorrect_multipart_installed_form_file"
	"tests/test_multipart_installation.py::test_no_multipart_installed"
	"tests/test_multipart_installation.py::test_no_multipart_installed_file"
	"tests/test_multipart_installation.py::test_no_multipart_installed_file_bytes"
	"tests/test_multipart_installation.py::test_no_multipart_installed_multi_form"
	"tests/test_multipart_installation.py::test_no_multipart_installed_form_file"
	"tests/test_multipart_installation.py::test_old_multipart_installed"
	# Hangs with network-sandbox
	"tests/test_tutorial/test_websockets/test_tutorial003_py39.py::test_websocket_handle_disconnection"
	# Flaky
	"tests/test_tutorial/test_custom_docs_ui/test_tutorial001.py::test_redoc_html"
	"tests/test_tutorial/test_custom_docs_ui/test_tutorial002.py::test_redoc_html"
	# Avoid logfire, big LLM specific deptree
	">tests/test_telemetry/test_environment_integrations.py::test_environment_export_with_existing_integrations[logfire]"
	"tests/test_telemetry/test_background.py::test_background_task_integrations[logfire]"
	"tests/test_telemetry/test_background.py::test_background_task_integrations[native_logfire]"
	"tests/test_telemetry/test_environment_integrations.py::test_environment_export_with_existing_integrations[logfire-opt-out]"
	"tests/test_telemetry/test_environment_integrations.py::test_environment_export_with_existing_integrations[logfire]"
	"tests/test_telemetry/test_integrations.py::test_current_logfire"
	"tests/test_telemetry/test_integrations.py::test_logfire_global_provider_without_fastapi_instrumentor"
	"tests/test_telemetry/test_native_integrations.py::test_logfire_native_spans_and_exception_logs"
	"tests/test_telemetry/test_runtime.py::test_concurrent_provider_owner_wins"
	"tests/test_telemetry/test_runtime.py::test_registration_provider_prefers_public_metric_reader"
	# Avoid sentry-sdk, test suite requires extra effort
	"tests/test_telemetry/test_environment_integrations.py::test_environment_export_with_existing_integrations"
	"tests/test_telemetry/test_integrations.py::test_current_sentry"
	"tests/test_telemetry/test_integrations.py::test_inactive_sentry_does_not_disable_native"
	"tests/test_telemetry/test_native_integrations.py::test_sentry_standard_log_processor"
	# Flaky
	"tests/test_dependency_contextmanager.py::test_async_state"
	"tests/test_dependency_contextmanager.py::test_sync_state"
	"tests/test_dependency_contextmanager.py::test_async_raise_other"
	"tests/test_dependency_contextmanager.py::test_sync_raise_other"
	"tests/test_tutorial/test_settings/test_app01.py::test_settings_validation_error"
)

python_prepare_all() {
	# Dont install fastapi executable as fastapi-cli is supposed to handle it
	sed -i -e '/\[project.scripts\]/,/^$/d' pyproject.toml || die

	distutils-r1_python_prepare_all
}

python_test() {
	if [[ ${EPYTHON} == python3.15 ]]; then
		local EPYTEST_IGNORE=(
			# strawberry-graphql not available for py3.15 yet
			"tests/test_tutorial/test_graphql/test_tutorial001.py"
		)
	fi
	epytest
}

pkg_postinst() {
	optfeature "commandline interface" dev-python/fastapi-cli
	optfeature "test client" dev-python/httpx dev-python/httpx2
	optfeature "templates" dev-python/jinja2
	optfeature "forms and file uploads" dev-python/python-multipart
	optfeature "validate emails" dev-python/email-validator
	optfeature "uvicorn with uvloop" dev-python/uvicorn
	optfeature "settings management" dev-python/pydantic-settings
	optfeature "extra Pydantic data types" dev-python/pydantic-extra-types
	optfeature_header "Alternative JSON responses"
	optfeature "ORJSONResponse" dev-python/orjson
	optfeature "UJSONResponse" dev-python/ujson
}
