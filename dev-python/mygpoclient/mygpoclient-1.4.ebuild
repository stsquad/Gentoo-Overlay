# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit distutils

EAPI="2"
SUPPORT_PYTHON_ABIS="1"

if [[ ${PV} == "9999" ]] ; then
	inherit git
	KEYWORDS="~x86 ~amd64 ~amd64-linux ~x86-linux"
	EGIT_REPO_URI="git://repo.or.cz/mygpoclient.git"
else
	KEYWORDS="x86 amd64 amd64-linux x86-linux"
	SRC_URI="http://thpinfo.com/2010/${PN}/${P}.tar.gz"
	RESTRICT="nomirror"
fi

DESCRIPTION="Pythonic interface to the gpodder.net web services."
HOMEPAGE="http://thpinfo.com/2010/mygpoclient/ http://gpodder.net"

LICENSE="GPL-3"
SLOT="0"

RDEPEND="|| ( >=dev-lang/python-2.6
			  dev-python/simplejson )"

DEPEND="${RDEPEND}
  dev-python/setuptools"

RESTRICT_PYTHON_ABIS="3.*"
