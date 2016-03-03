# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

PYTHON_COMPAT=( python{2_5,2_6,2_7,3_2,3_3,3_4} )

inherit distutils

DESCRIPTION="A helper library for integrating Pythos development in Emacs"
HOMEPAGE="http://github.com/jorgenschaefer/elpy"
SRC_URI="mirror://pypi/${PN:0:1}/${PN}/${P}.tar.gz"

KEYWORDS="~amd64 ~x86"
IUSE=""
LICENSE="GPL"
SLOT="0"

DEPEND="${RDEPEND}
	|| ( dev-python/rope dev-python/jedi )
	dev-python/pyflakes
	dev-python/pip
	dev-python/nose"
