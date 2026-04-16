# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=poetry
inherit distutils-r1 pypi

DESCRIPTION="A Python wrapper for the Discord API forked from discord.py"
HOMEPAGE="https://github.com/nextcord/nextcord https://pypi.org/project/nextcord/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test voice speed"
RESTRICT="!test? ( test )"

DOCS="README.rst"

RDEPEND="
    dev-python/aiohttp[${PYTHON_USEDEP}]
    dev-python/typing-extensions[${PYTHON_USEDEP}]
    dev-python/audioop-lts[${PYTHON_USEDEP}]
    voice? ( dev-python/pynacl[${PYTHON_USEDEP}] )
    speed? (
        dev-python/brotli[${PYTHON_USEDEP}]
        dev-python/aiodns[${PYTHON_USEDEP}]
        dev-python/brotlicffi[${PYTHON_USEDEP}]
        dev-python/orjson[${PYTHON_USEDEP}]
    )
"

python_prepare_all() {
	python3 - <<'EOF' || die "Failed to patch pyproject.toml"
import re, pathlib

p = pathlib.Path("pyproject.toml")
lines = p.read_text().splitlines(keepends=True)
out = []
skip = False

for line in lines:
    s = line.strip()

    # On any section header, decide whether to enter skip mode.
    # We drop:
    #   [tool.poetry.group.dev*]      — contains invalid non-package keys
    #   [tool.poetry-dynamic-versioning] — not needed and confuses poetry-core
    if re.match(r'^\[', s):
        if (re.match(r'^\[tool\.poetry\.group\.dev', s) or
                re.match(r'^\[tool\.poetry-dynamic-versioning', s)):
            skip = True
            continue
        else:
            skip = False

    if skip:
        continue

    # Fix the build backend
    line = line.replace(
        '"poetry_dynamic_versioning.backend"',
        '"poetry.core.masonry.api"',
    )

    # Remove poetry-dynamic-versioning from the [build-system] requires array.
    # Two styles exist in the wild:
    #   single-line:  requires = ["poetry-core", "poetry-dynamic-versioning"]
    #   multi-line :  each entry on its own indented line
    # For multi-line, stripping just the quoted string leaves a bare ","
    # which is invalid TOML — so we drop the whole line instead.
    if "poetry-dynamic-versioning" in line:
        if re.match(r'^\s*requires\s*=', line):
            # Single-line array — strip just this entry
            line = re.sub(r',\s*"poetry-dynamic-versioning[^"]*"', "", line)
            line = re.sub(r'"poetry-dynamic-versioning[^"]*",?\s*', "", line)
        else:
            # Standalone array entry line — drop it entirely
            continue

    out.append(line)

p.write_text("".join(out))
EOF
	distutils-r1_python_prepare_all
}


distutils_enable_tests pytest
