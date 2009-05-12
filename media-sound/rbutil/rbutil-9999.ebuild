# Copyright 2008 Clemens Werther
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit subversion

ESVN_REPO_URI="svn://svn.rockbox.org/rockbox/trunk"

DESCRIPTION="The Rockbox Utility, all you need for installing and managing rockbox"
HOMEPAGE="http://www.rockbox.org/twiki/bin/view/Main/RockboxUtility"

LICENSE="GPL-2"
SLOT="0"
IUSE=""

KEYWORDS="~x86 ~amd64"

DEPEND="${RDEPEND}"
RDEPEND=">=x11-libs/qt-core-4.3
	>=x11-libs/qt-gui-4.3"

src_unpack()
{
	mkdir -p ${S}/rbutil ${S}/tools ${S}/apps
	subversion_fetch ${ESVN_REPO_URI}/rbutil rbutil
        subversion_fetch ${ESVN_REPO_URI}/tools tools
        subversion_fetch ${ESVN_REPO_URI}/apps apps
}

src_compile() {
	cd rbutil
	qmake || die "qmake failed"
	emake || die "make failed"
}

src_install() {
	dobin ${S}/rbutil/rbutilqt/rbutilqt
	insinto "/etc"
	doins ${S}/rbutil/rbutilqt/rbutil.ini
	newicon ${S}/rbutil/rbutilqt/icons/rockbox.ico ${PN}.ico
	make_desktop_entry rbutilqt "Rockbox Utility" /usr/share/pixmaps/${PN}.ico
}

