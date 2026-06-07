# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12,13,14} )

inherit distutils-r1 pypi

DESCRIPTION="Asynchronous Python library to communicate with the Husqvarna Automower Connect API"
HOMEPAGE="
	https://github.com/Thomas55555/aioautomower
	https://pypi.org/project/aioautomower/
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	<dev-python/pyjwt-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.8.0[${PYTHON_USEDEP}]
	<dev-python/aiohttp-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.9.3[${PYTHON_USEDEP}]
	>=dev-python/ical-8.0.1[${PYTHON_USEDEP}]
	<dev-python/mashumaro-4.0[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
	<dev-python/orjson-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.11.2[${PYTHON_USEDEP}]
	<dev-python/python-dateutil-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9.0[${PYTHON_USEDEP}]
	<dev-python/tzlocal-6.0[${PYTHON_USEDEP}]
	>=dev-python/tzlocal-5.2[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-7.0[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/aresponses[${PYTHON_USEDEP}]
		dev-python/syrupy[${PYTHON_USEDEP}]
	)
"

python_prepare_all() {
	python3 - <<'EOF' || die "Failed to patch pyproject.toml"
import re, pathlib

p = pathlib.Path("pyproject.toml")
lines = p.read_text().splitlines(keepends=True)
out, skip = [], False

for line in lines:
	s = line.strip()

	# 1. Replace the build backend
	line = line.replace(
		'"poetry_dynamic_versioning.backend"',
		'"poetry.core.masonry.api"',
	)

	# 2. Remove poetry-dynamic-versioning from [build-system] requires
	if "poetry-dynamic-versioning" in line:
		line = re.sub(r',?\s*"poetry-dynamic-versioning[^"]*"', "", line)
		line = re.sub(r'"poetry-dynamic-versioning[^"]*",?\s*', "", line)

	# 3. Drop ALL [tool.poetry.group.dev*] sections and their content.
	#    poetry-core rejects the non-package keys (e.g. enable/metadata)
	#    that poetry-dynamic-versioning places there; we don't need dev
	#    deps to build the wheel anyway.
	if re.match(r'^\[tool\.poetry\.group\.dev', s):
		skip = True
		continue
	if skip and s.startswith("["):
		skip = False
	if not skip:
		out.append(line)

p.write_text("".join(out))
EOF
	distutils-r1_python_prepare_all
}

src_test() {
	epytest tests/
}