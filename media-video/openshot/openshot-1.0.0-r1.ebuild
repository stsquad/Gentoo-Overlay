# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=2

inherit distutils fdo-mime

MY_P=${PN}_${PV}-1

DESCRIPTION="OpenShot Video Editor is a non-linear video editor"
HOMEPAGE="http://www.openshotvideo.com"
SRC_URI="http://launchpad.net/openshot/1.0/${PV}/+download/${MY_P}.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="faac faad ieee1394 jack mp3 quicktime theora vorbis x264"

DEPEND=""
RDEPEND="
	>=dev-lang/python-2.5[xml]
	dev-python/pygtk
	dev-python/pygoocanvas
	dev-python/pyxdg
	>=media-libs/mlt-0.4.6-r1[dv,ffmpeg,frei0r,melt,python,quicktime?,xml]
	media-sound/sox[encode,ffmpeg]
	media-video/ffmpeg[encode,ieee1394?,jack?,x264?,vorbis?,theora?,faac?,faad?,mp3?]"
	# TODO: revisit deps (especially gnome-base/librsvg pygtk2-libglade)

S=${WORKDIR}/${PN}

src_prepare() {
	# Avoid stuff covered by fdo-mime.eclass
	# (update-mime-database update-desktop-database update-mime)
	# export "FAKEROOTKEY=gentoo" does not work as this variable is filtered by portage
	sed -i -e '/FAILED = /q' setup.py
}

pkg_postinst() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}

pkg_postrm() {
	fdo-mime_mime_database_update
	fdo-mime_desktop_database_update
}
