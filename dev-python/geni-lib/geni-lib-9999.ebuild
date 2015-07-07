# Package the latest geni-lib from source

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils mercurial

PYTHON_MODNAME="geni-lib"

DESCRIPTION="A python library for building RSpecs"
HOMEPAGE="http://groups.geni.net/geni/wiki/HowTo/SetupGENILIB"
EHG_REPO_URI="https://bitbucket.org/barnstorm/geni-lib"

LICENSE="Python License"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/m2crypto
	dev-python/lxml
	dev-python/setuptools"

S="${WORKDIR}/${PN}"

src_install() {
	distutils_src_install
}
