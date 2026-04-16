# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11,12,13} )

inherit distutils-r1 pypi

DESCRIPTION="Python module to talk to Google Air Quality API"
HOMEPAGE="
	https://github.com/deryck1822/google-air-quality-api
	https://pypi.org/project/google-air-quality-api/
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/aiohttp-3.9.3[${PYTHON_USEDEP}]
	>=dev-python/mashumaro-3.12[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/poetry-core[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
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
    #    poetry-core rejects the non-package keys that
    #    poetry-dynamic-versioning places there.
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

python_test() {
	epytest tests/
}
