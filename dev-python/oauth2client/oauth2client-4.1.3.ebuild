EAPI=8

PYTHON_COMPAT=( python3_{12..14} )
DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="OAuth 2.0 client library (deprecated, used by PyDrive2)"
HOMEPAGE="https://pypi.org/project/oauth2client/"
LICENSE="Apache-2.0"
SRC_URI="https://files.pythonhosted.org/packages/source/${PN::1}/${PN}/${PN}-${PV}.tar.gz"
RESTRICT="mirror test"

SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/httplib2[${PYTHON_USEDEP}]
	dev-python/pyasn1[${PYTHON_USEDEP}]
	dev-python/pyasn1-modules[${PYTHON_USEDEP}]
	dev-python/rsa[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
