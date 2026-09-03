# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
PYTHON_REQ_USE="threads(+)"
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1 pypi

DESCRIPTION="The core module of Alibaba Cloud (Aliyun) Python SDK"
HOMEPAGE="https://github.com/aliyun/aliyun-openapi-python-sdk/tree/master/aliyun-python-sdk-core
    https://pypi.org/project/aliyun-python-sdk-core/"

# PyPI 2.16.1 ships only the built wheel; --unpack dumps its contents
# (aliyunsdkcore/, *.dist-info/) directly into ${WORKDIR}.
SRC_URI="$(pypi_wheel_url --unpack)"

S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm ~arm64 ~x86"

RDEPEND="
    >=dev-python/cryptography-3.0.0[${PYTHON_USEDEP}]
    >=dev-python/jmespath-0.9.3[${PYTHON_USEDEP}]
    <dev-python/jmespath-2.0.0[${PYTHON_USEDEP}]
"

# app-arch/unzip: required by pypi_wheel_url --unpack
# dev-python/setuptools: PEP517-mode eclass no longer pulls this in implicitly;
# you MUST declare the backend dependency yourself in this mode.
BDEPEND="
    app-arch/unzip
    >=dev-python/setuptools-61[${PYTHON_USEDEP}]
"

python_prepare_all() {
    # Discard the pre-baked dist-info so fresh, interpreter-appropriate
    # metadata is generated during the wheel build below.
    rm -rf "${S}"/*.dist-info || die

    # Synthesize the project configuration that a wheel never carries.
    # Every directive here mirrors upstream setup.py verbatim
    # (packages=find_packages(exclude=["tests*"]) + package_data),
    # otherwise runtime assets (endpoint JSONs, cacert.pem) silently vanish.
    cat > "${S}"/pyproject.toml <<-'EOF'
		[build-system]
		requires = ["setuptools>=61"]
		build-backend = "setuptools.build_meta"

		[project]
		name = "aliyun-python-sdk-core"
		version = "2.16.1"
		description = "The core module of Aliyun Python SDK."
		requires-python = ">=3.7"
		dependencies = [
		    "cryptography>=3.0.0",
		    "jmespath>=0.9.3,<2.0.0",
		]

		[tool.setuptools.packages.find]
		where = ["."]
		include = ["aliyunsdkcore*"]

		[tool.setuptools.package-data]
		"aliyunsdkcore" = [
		    "data/*.json",
		    "*.pem",
		    "vendored/*.pem",
		]
		"aliyunsdkcore.vendored.requests.packages.certifi" = ["cacert.pem"]
	EOF

    distutils-r1_python_prepare_all
}

pkg_postinst() {
    elog "This is the core library required by most Alibaba Cloud service SDKs"
    elog "(e.g. aliyun-python-sdk-iot, aliyun-python-sdk-ecs, etc.)"
    elog ""
    elog "Note: The V1.0 family of SDKs is considered legacy by Alibaba Cloud."
    elog "They recommend using the newer OpenAPI V2 / Tea-based SDKs where possible."
}
