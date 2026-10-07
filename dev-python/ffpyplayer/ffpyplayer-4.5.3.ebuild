# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A cython implementation of an ffmpeg based player."
HOMEPAGE="https://matham.github.io/ffpyplayer/ https://pypi.org/project/ffpyplayer/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	media-video/ffmpeg
"
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	<dev-python/setuptools-70[${PYTHON_USEDEP}]
"

# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools
inherit pypi distutils-r1

DESCRIPTION="A cython implementation of an ffmpeg based player."
HOMEPAGE="https://matham.github.io/ffpyplayer/ https://pypi.org/project/ffpyplayer/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DEPEND="
    media-video/ffmpeg
"
RDEPEND="
    media-video/ffmpeg
"
BDEPEND="
    dev-python/cython[${PYTHON_USEDEP}]
    dev-python/setuptools[${PYTHON_USEDEP}]
"

src_prepare() {
    default

    # --- FIX FOR SETUPTOOLS >= 70 ---
    # ffpyplayer 4.5.3 has two bugs with modern setuptools:
    # 1. setuptools >= 70 removed 'finalized' from Command. We add it as a class attribute.
    # 2. FFBuildExt.__init__ doesn't call the parent init, so self.distribution is missing.
    #    We patch __init__ to call super().__init__(*args, **kwargs).
    local setup_py_file

    if [[ -f "${S}/ffpyplayer/setup.py" ]]; then
	setup_py_file="${S}/ffpyplayer/setup.py"
    elif [[ -f "${S}/setup.py" ]]; then
	setup_py_file="${S}/setup.py"
    else
	ewarn "Could not find 'setup.py' (tried ${S}/ffpyplayer/setup.py and ${S}/setup.py)"
	return 0
    fi

    python3 -c "
import sys

def get_indent(line):
    return len(line) - len(line.lstrip())

path = r'$setup_py_file'
with open(path) as f:
    lines = f.readlines()

# 1. Find FFBuildExt class
start = None
for i, line in enumerate(lines):
    if line.strip().startswith('class FFBuildExt'):
        start = i
        break

if start is None:
    print('FFBuildExt class not found', file=sys.stderr)
    sys.exit(1)

base_indent = get_indent(lines[start])
end = None
for j in range(start + 1, len(lines)):
    l = lines[j]
    if l.strip() and not l.strip().startswith('#'):
        cur_indent = get_indent(l)
        if cur_indent <= base_indent and (l.strip().startswith('class ') or l.strip().startswith('def ')):
            end = j
            break
if end is None:
    end = len(lines)

# 2. Ensure 'finalized = False' is a class attribute
found_finalized = any(lines[j].strip().startswith('finalized = False') for j in range(start, end))
if not found_finalized:
    insert_line = start + 1
    while insert_line < end and lines[insert_line].strip() == '':
        insert_line += 1
    lines.insert(insert_line, ' ' * (base_indent + 4) + 'finalized = False\n')

# 3. Ensure __init__ calls super().__init__(*args, **kwargs)
init_start = init_end = None
for j in range(start, end):
    if lines[j].strip().startswith('def __init__'):
        init_start = j
        init_indent = get_indent(lines[j])
        for k in range(j + 1, end):
            lk = lines[k]
            if lk.strip() and not lk.strip().startswith('#'):
                cur_indent = get_indent(lk)
                if cur_indent <= init_indent:
                    init_end = k
                    break
        if init_end is None:
            init_end = end
        break

if init_start is not None:
    has_super = any('super().__init__' in lines[j] for j in range(init_start, init_end))
    if not has_super:
        last_line_idx = init_start
        for k in range(init_start + 1, init_end):
            if lines[k].strip():
                last_line_idx = k
        lines.insert(last_line_idx + 1, ' ' * (init_indent + 4) + 'super().__init__(*args, **kwargs)\n')
else:
    first_def = None
    for j in range(start + 1, end):
        if lines[j].strip().startswith('def '):
            first_def = j
            break
    if first_def is None:
        first_def = end
    init_indent = base_indent + 4
    init_lines = [
        ' ' * init_indent + 'def __init__(self, *args, **kwargs):\n',
        ' ' * (init_indent + 4) + 'self.finalized = False\n',
        ' ' * (init_indent + 4) + 'super().__init__(*args, **kwargs)\n',
        ' ' * init_indent + '\n',
    ]
    for line in init_lines:
        lines.insert(first_def, line)
        first_def += 1

with open(path, 'w') as f:
    f.writelines(lines)

print('Patched %s: added finalized = False and super().__init__() call' % path)
"
    # --- END FIX ---
}

src_configure() {
    distutils-r1_src_configure
}

src_compile() {
    distutils-r1_src_compile
}

src_install() {
    distutils-r1_src_install
}