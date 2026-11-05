# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{12..15} )

inherit distutils-r1

DESCRIPTION="PostgreSQL database adapter for Python"
HOMEPAGE="
	https://www.psycopg.org/psycopg3/
	https://github.com/psycopg/psycopg/
	https://pypi.org/project/psycopg/
"
SRC_URI="
	https://github.com/psycopg/psycopg/archive/${PV}.tar.gz
		-> ${P}.gh.tar.gz
"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="+native-extensions"

DEPEND="
	native-extensions? (
		>=dev-db/postgresql-8.1:=
	)
	!native-extensions? (
		>=dev-db/postgresql-8.1:*
	)
"
RDEPEND="
	${DEPEND}
	$(python_gen_cond_dep '
		>=dev-python/typing-extensions-4.6[${PYTHON_USEDEP}]
	' 3.12)
"
BDEPEND="
	native-extensions? (
		dev-python/cython[${PYTHON_USEDEP}]
	)
	test? (
		>=dev-db/postgresql-8.1[server]
		>=dev-python/dnspython-2.1[${PYTHON_USEDEP}]
	)
"

EPYTEST_PLUGINS=( anyio )
distutils_enable_tests pytest

python_compile() {
    # The upstream source tree is a flat layout with three top-level
    # packages: psycopg (pure-Python), psycopg_c (C extension) and
    # psycopg_pool (async pool, not built here).  Building from the
    # project root makes setuptools' auto-discovery refuse to proceed
    # because it cannot tell which packages are intentional.
    #
    # The canonical setup.py lives inside the psycopg/ sub-directory
    # and knows how to locate the C sources via a relative path.  We
    # therefore chdir into psycopg/ and let distutils-r1 build a single
    # wheel that contains both psycopg and psycopg_c in one shot.
    #
    # The build is parameterised by the PSYCOPG_IMPL env-var: when it
    # is set to "c", the C extension is compiled; otherwise a pure-
    # Python wheel is produced.
    cd psycopg || die
    distutils-r1_python_compile
}

src_test() {
    rm -r psycopg{,_c} || die

    initdb -D "${T}"/pgsql || die
    # TODO: random port
    pg_ctl -w -D "${T}"/pgsql start \
	-o "-h '' -k '${T}'" || die
    createdb -h "${T}" test || die

    local -x PSYCOPG_TEST_DSN="host=${T} dbname=test"
    distutils-r1_src_test

    pg_ctl -w -D "${T}"/pgsql stop || die
}

python_test() {
    local EPYTEST_DESELECT=(
	# tests for the psycopg_pool package
	tests/pool
	# some broken mypy magic
	tests/test_module.py::test_version
	tests/test_module.py::test_version_c
	tests/test_typing.py
	tests/crdb/test_typing.py
	# TODO, relying on undefined ordering in Python?
	tests/test_dns_srv.py::test_srv
	# requires pproxy?
	tests/test_waiting.py::test_remote_closed
	tests/test_waiting.py::test_wait_remote_closed
	tests/test_waiting_async.py::test_remote_closed
	tests/test_waiting_async.py::test_wait_remote_closed
    )

    case ${ARCH} in
	arm|x86)
	    EPYTEST_DESELECT+=(
		# TODO
		tests/types/test_numpy.py::test_classes_identities
	    )
	    ;;
    esac

    local impls=( python )
    if use native-extensions && [[ ${EPYTHON} != pypy3* ]]; then
	impls+=( c )
    fi

    local -x PSYCOPG_IMPL
    for PSYCOPG_IMPL in "${impls[@]}"; do
	einfo "Testing with ${PSYCOPG_IMPL} implementation ..."
	# leak and timing tests are fragile whereas slow tests are slow
	epytest -k "not leak" \
	    -m "not timing and not slow and not flakey"
    done
}