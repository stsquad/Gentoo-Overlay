# Package the latest flickrapi from source

EAPI="3"
PYTHON_DEPEND="2"
SUPPORT_PYTHON_ABIS="1"
RESTRICT_PYTHON_ABIS="3.*"
DISTUTILS_SRC_TEST="setup.py"

inherit distutils mercurial

PYTHON_MODNAME="flickrapi"

DESCRIPTION="An implementation of the flickrapi in python"
HOMEPAGE="http://stuvel.eu/projects/flickrapi"
EHG_REPO_URI="http://hg.stuvel.eu/flickrapi"

LICENSE="Python License"
SLOT="0"
KEYWORDS="~amd64"
IUSE="examples"

RDEPEND=""
DEPEND="${RDEPEND}
	dev-python/setuptools"

S="${WORKDIR}/${PN}"

src_install() {
	distutils_src_install
}
