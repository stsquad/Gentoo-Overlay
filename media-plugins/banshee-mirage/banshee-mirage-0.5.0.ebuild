# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="2"

inherit mono

MY_PN="mirage"
MY_P="${MY_PN}-${PV}"

DESCRIPTION="Automatic Playlist Generation Extension for Banshee"
HOMEPAGE="http://hop.at/mirage/"
SRC_URI="http://hop.at/${MY_PN}/download/mirage-0.5.0.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND=">=media-sound/banshee-1.4
	sci-libs/fftw:3.0
	dev-db/sqlite:3
	media-libs/libsamplerate[fftw]
	>=dev-dotnet/gtk-sharp-2.10"
DEPEND="${RDEPEND}
	sys-devel/libtool
	dev-util/pkgconfig"

S="${WORKDIR}/${MY_P}"

src_install() {
	emake DESTDIR="${D}" install || die "installation failed"
	dodoc ChangeLog README
}
