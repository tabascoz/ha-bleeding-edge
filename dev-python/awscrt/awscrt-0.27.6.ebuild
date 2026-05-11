# Copyright 2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_EXT=1
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=(python3_{9..14})

inherit distutils-r1 pypi

DESCRIPTION="Python bindings for the AWS Common Runtime"
HOMEPAGE="
	https://github.com/awslabs/aws-crt-python
	https://pypi.org/project/awscrt/
"

IUSE="test"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"


#PATCHES=(
#    "${FILESDIR}/awscrt-0.27.6-const-fix.patch"
#)


RDEPEND=""
BDEPEND="
	test? (
		dev-python/unittest-or-fail
		dev-python/boto3
		dev-python/pytest
		dev-python/websockets
	)"
src_prepare() {
    # GCC 14+ treats memchr(const void*, ...) as returning const void*.
    # The wrapper returns void*, so explicitly cast to suppress -Werror=discarded-qualifiers.
    sed -i \
        's|return memchr(s, c, n);|return (void *)memchr(s, c, n);|' \
        crt/aws-lc/crypto/internal.h || die "sed failed on internal.h"

    distutils-r1_src_prepare
}

python_install() {
    distutils-r1_python_install
    rm -rf "${D}$(python_get_sitedir)/tests" || die
}

distutils_enable_tests unittest
