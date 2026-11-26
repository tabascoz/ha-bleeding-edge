# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# HASS-data-detective is an application you run *against* a Home Assistant
# install - it opens that install's recorder database - not a library Home
# Assistant imports, so it belongs in app-misc beside homeassistant-full,
# ha-mcp and predbat.
#
# The interpreter is the one app-misc/homeassistant-full uses (python3_14), so
# the package is importable from the environment HA and a Jupyter kernel run in
# (same reasoning as app-misc/ha-mcp).  Upstream declares
# requires-python = ">=3.12,<3.13"; that pin is stale and unenforceable here -
# no python3.12 exists on this box and nothing in the toolchain checks it - and
# the tree is pure Python: measured 2026-11-25 it builds and its own 16 tests
# pass on python3.14 against the installed dev-python/pandas-3.1.1 and
# dev-python/sqlalchemy-2.0.54.
PYTHON_COMPAT=( python3_14 )
DISTUTILS_USE_PEP517=setuptools
PYPI_PN="HASS-data-detective"

inherit distutils-r1 pypi

DESCRIPTION="Tools for studying Home Assistant data"
HOMEPAGE="
	https://github.com/robmarkcole/HASS-data-detective
	https://pypi.org/project/HASS-data-detective/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.md"

# Mirrors [project].dependencies of HASS-data-detective 3.5.1 as atoms.
#
# Deliberately NOT declared:
#   * A DBAPI for a non-sqlite recorder db_url.  HA's default recorder is
#     sqlite, whose driver comes from dev-lang/python[sqlite]; a
#     recorder: db_url of mysql:// / postgresql:// needs dev-python/pymysql /
#     dev-python/psycopg, which upstream does not declare and which only fails
#     at connect() time (core.py raises "The right dependency to connect to
#     your database is missing").  Documented in pkg_postinst instead.
#   * dev-python/jupyterlab.  Notebooks are how the tool is used, but upstream
#     ships no dependency on it - its README tells you to install JupyterLab
#     yourself.  The example notebook is installed under /usr/share/doc so it
#     can be opened without cloning upstream.
RDEPEND="
	>=dev-python/pandas-1.1.4[${PYTHON_USEDEP}]
	>=dev-python/ruamel-yaml-0.15.78[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0.7[${PYTHON_USEDEP}]
	dev-python/pytz[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/setuptools-scm[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_prepare_all() {
	# The version is dynamic (setuptools-scm).  This sdist ships
	# HASS_data_detective.egg-info/scm_version.json so the version resolves, but
	# pin it to PV anyway: without it an sdist that stops shipping that file
	# builds as 0.0.0 (same reason as dev-python/yagrc).
	export SETUPTOOLS_SCM_PRETEND_VERSION=${PV}
	distutils-r1_python_prepare_all
}

src_install() {
	distutils-r1_src_install

	# The upstream notebook is the documented entry point of the tool.
	docinto examples
	dodoc "notebooks/Getting started with detective.ipynb"
}

pkg_postinst() {
	elog "HASS-data-detective reads the data a Home Assistant instance records and"
	elog "hands it to you as pandas DataFrames.  It has no command and no service:"
	elog "import it from Python, or from a notebook, running on the interpreter it"
	elog "was built for - python3.14 here, the one Home Assistant uses."
	elog ""
	elog "  from detective import core, functions"
	elog ""
	elog "  db = core.db_from_hass_config(\"/etc/homeassistant\")    # by config dir"
	elog "  db = core.HassDatabase(\"sqlite:////tmp/ha.db\")         # by database url"
	elog ""
	elog "  db.entities                                       # what was recorded"
	elog "  db.fetch_all_sensor_data()                        # all sensor states"
	elog "  db.fetch_all_data_of((\"sensor.kitchen\",))         # chosen entities"
	elog "  db.fetch_all_statistics_of((\"sensor.kitchen\",))   # long-term statistics"
	elog ""
	elog "  functions.format_dataframe(df)      # numeric states, real datetimes"
	elog ""
	elog "Pass the config directory.  Auto-discovery knows only a container"
	elog "(\$HASSIO_TOKEN -> /config) or ~/.homeassistant; the Home Assistant this"
	elog "overlay installs keeps its configuration in /etc/homeassistant."
	elog ""
	elog "The recorder database uses WAL, so opening the live file also needs write"
	elog "access next to it.  As an ordinary user, analyse a copy of it:"
	elog "  cp /etc/homeassistant/home-assistant_v2.db /tmp/ha.db"
	elog "or run as the Home Assistant user:"
	elog "  sudo -u homeassistant python3.14 report.py"
	elog ""
	elog "fetch_all_data_of() returns last_updated_ts as a POSIX number and caps the"
	elog "result at 50000 rows - pass limit= for more, or limit=None for all, and"
	elog "filter by time afterwards; the queries themselves have no date range."
	elog "format_dataframe() turns states into numbers and drops the rows that are"
	elog "not numbers, so count state changes on the unformatted frame."
	elog ""
	elog "Not pulled in, because upstream does not depend on them: a driver for a"
	elog "non-sqlite recorder db_url (dev-python/pymysql, dev-python/psycopg),"
	elog "dev-python/matplotlib for plots, dev-python/jupyterlab for notebooks."
	elog "Upstream's example notebook is installed under"
	elog "/usr/share/doc/${PF}/examples/."
}
