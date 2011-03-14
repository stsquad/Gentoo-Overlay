# Package the latest PyFacebook

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils git

PYTHON_MODNAME="pyfacebook"

DESCRIPTION="An implementation of the Facebook API in Python"
HOMEPAGE="http://code.google.com/p/pyfacebook/"
EGIT_REPO_URI="git://github.com/sciyoshi/pyfacebook.git"

LICENSE="Python License"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

RDEPEND="dev-python/django"

DEPEND="${RDEPEND}
	dev-python/setuptools"

S="${WORKDIR}/${PN}"

src_install() {
	distutils_src_install
}
