# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..15} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="aiomisc - miscellaneous utils for asyncio"
HOMEPAGE="
	https://github.com/aiokitchen/aiomisc
	https://pypi.org/project/aiomisc/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="aiohttp asgi carbon cron dns grpc raven rich test uvicorn uvloop"

# relaxed by tools/relaxbounds.py: an operator in the block below named a version
# no repo carries. The bound is answered with the newest version that IS available -
# never a downgrade, never a version nobody declared (WORKFLOW.md step 12's rule).
RDEPEND="
	>=dev-python/aiothreads-1.1.4[${PYTHON_USEDEP}]
	>=dev-python/colorlog-6.0[${PYTHON_USEDEP}]
	<dev-python/colorlog-7.0[${PYTHON_USEDEP}]
	dev-python/logging-journald[${PYTHON_USEDEP}]
	aiohttp? (
		>dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
	)
	asgi? (
		>=dev-python/aiohttp-asgi-0.5.2[${PYTHON_USEDEP}]
	)
	carbon? (
		>=dev-python/aiocarbon-0.15[${PYTHON_USEDEP}]
	)
	cron? (
		>=dev-python/croniter-7.0.0[${PYTHON_USEDEP}]
	)
	dns? (
		>=dev-python/dnslib-0.9[${PYTHON_USEDEP}]
	)
	grpc? (
		>=dev-python/grpcio-1.56[${PYTHON_USEDEP}]
		>=dev-python/grpcio-tools-1.56[${PYTHON_USEDEP}]
		>=dev-python/grpcio-reflection-1.56[${PYTHON_USEDEP}]
	)
	raven? (
		>dev-python/aiohttp-3.0.0[${PYTHON_USEDEP}]
		dev-python/raven[${PYTHON_USEDEP}]
	)
	rich? (
		dev-python/rich[${PYTHON_USEDEP}]
	)
	uvicorn? (
		>=dev-python/uvicorn-0.27[${PYTHON_USEDEP}]
		>=dev-python/asgiref-3.7[${PYTHON_USEDEP}]
	)
	uvloop? (
		>=dev-python/uvloop-0.21[${PYTHON_USEDEP}]
		<dev-python/uvloop-1.0[${PYTHON_USEDEP}]
	)
"
BDEPEND="
	test? (
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/setproctitle[${PYTHON_USEDEP}]
	)
"

export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_AIOMISC=${PV}

EPYTEST_PLUGINS=( aiomisc-pytest )
EPYTEST_XDIST=1
distutils_enable_tests pytest

EPYTEST_IGNORE=(
	# Missing dependencies
	tests/test_carbon_service.py # aiocarbon
	tests/test_dns.py # dnslib
	tests/test_dns_server.py # dnslib
	tests/test_entrypoint.py # various
	tests/test_raven_service.py # raven
)

EPYTEST_DESELECT=(
	# Broken (race conditions)
	tests/test_thread_pool.py::test_from_thread_channel
	tests/test_thread_pool.py::test_from_thread_channel_wait_before
)