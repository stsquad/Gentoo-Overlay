# Copyright 1999-2005 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

inherit eutils

DESCRIPTION="A fullscreen task swicher (XD version)"
HOMEPAGE="http://www.thegraveyard.org/skippy.php"
SRC_URI="http://www.thegraveyard.org/files/${PF}.tar.bz2"
#SRC_URI="http://dev.gentoo.org/~compnerd/files/${PF}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="xinerama"

RDEPEND="x11-base/xorg-server
		 x11-libs/libXft
		 x11-libs/libXrender
		 x11-libs/libXcomposite
		 x11-libs/libXdamage
		 x11-libs/libXfixes
		 xinerama? ( x11-libs/libXext x11-libs/libXinerama )"
DEPEND="${RDEPEND}"

src_unpack() {
	unpack ${A}
	cd ${S}

	epatch ${FILESDIR}/${PF}-noxinerama.patch
	epatch ${FILESDIR}/${PF}-CARD32.patch

#	einfo "Running autogen..."
#	( sh ./autogen.sh --help &> /dev/null ) || die "build file generation failed"
}

src_compile() {
#	econf $(use_enable xinerama) || die "configure failed"
	emake || die "compile failed"
}

src_install() {
	einstall || die "Failed to install"

	dodir /usr/share/${PN}
	insinto /usr/share/${PN}
	doins ${S}/data/skippy-xd.rc-default

	dodoc AUTHORS ChangeLog INSTALL NEWS README THANKS
}

pkg_postinst() {
	einfo
	einfo "You must create a ~/.skippy-xd.rc for running skippy-xd.  There is an"
	einfo "example file in /usr/share/${PN} ."
	einfo
	ebeep 5
}
