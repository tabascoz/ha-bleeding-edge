# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_VERIFY_REPO=https://github.com/getmoto/moto
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 pypi toolchain-funcs

DESCRIPTION="Mock library for boto"
HOMEPAGE="
	https://github.com/getmoto/moto/
	https://pypi.org/project/moto/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~riscv"

RDEPEND="
	>=dev-python/boto3-1.9.201[${PYTHON_USEDEP}]
	>=dev-python/botocore-1.20.88[${PYTHON_USEDEP}]
	>=dev-python/cryptography-35.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.5[${PYTHON_USEDEP}]
	dev-python/xmltodict[${PYTHON_USEDEP}]
	>=dev-python/werkzeug-0.5[${PYTHON_USEDEP}]
	>=dev-python/responses-0.15.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/antlr4-python3-runtime[${PYTHON_USEDEP}]
		dev-python/freezegun[${PYTHON_USEDEP}]
		dev-python/joserfc[${PYTHON_USEDEP}]
		dev-python/pyotp[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=()
EPYTEST_RERUNS=5
: "${EPYTEST_TIMEOUT:=180}"
EPYTEST_XDIST=1
distutils_enable_tests pytest

python_test() {
	local EPYTEST_DESELECT=(
		# TODO
		tests/test_dynamodb/test_dynamodb_import_table.py
		# require py_partiql_parser
		tests/test_dynamodb/test_dynamodb_statements.py
		tests/test_s3/test_s3_select.py
		# require graphql
		tests/test_appsync/test_appsync_schema.py
		# Internet
		tests/test_core/test_request_passthrough.py::test_passthrough_calls_for_entire_service
		tests/test_core/test_request_passthrough.py::test_passthrough_calls_for_specific_url
		tests/test_core/test_request_passthrough.py::test_passthrough_calls_for_wildcard_urls
		tests/test_firehose/test_firehose_put.py::test_put_record_http_destination
		tests/test_firehose/test_firehose_put.py::test_put_record_batch_http_destination
		# Appears to be internet issues with timing out
		tests/test_s3/test_multiple_accounts_server.py::TestAccountIdResolution::test_with_custom_request_header
		tests/test_s3/test_server.py::test_s3_server_post_cors_multiple_origins
	)
	local EPYTEST_IGNORE=(
		# require joserfc
		tests/test_cognitoidp/test_cognitoidp.py
	)

	if ! tc-has-64bit-time_t; then
		einfo "time_t is smaller than 64 bits, will skip broken tests"
		EPYTEST_DESELECT+=(
			tests/test_acm/test_acm.py::test_request_certificate_with_optional_arguments
			tests/test_s3/test_multiple_accounts_server.py::TestAccountIdResolution::test_with_custom_request_header
			tests/test_s3/test_server.py::test_s3_server_post_cors_multiple_origins
		)
		EPYTEST_IGNORE+=(
			tests/test_route53domains/test_route53domains_domain.py
		)
	fi

	local -x TZ=UTC
	local -x AWS_DEFAULT_REGION=us-east-1

	# -o timeout_func_only=true: bad interaction with pytest-rerunfailures and pytest-timeout leads to a permanent hang otherwise
	epytest -m 'not network and not requires_docker' -o timeout_func_only=true
}