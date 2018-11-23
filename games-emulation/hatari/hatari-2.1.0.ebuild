# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6
PYTHON_COMPAT=( python2_7 )

inherit toolchain-funcs cmake-utils python-single-r1 readme.gentoo-r1

DESCRIPTION="Atari ST emulator"
HOMEPAGE="http://hatari.tuxfamily.org/"
SRC_URI="http://download.tuxfamily.org/hatari/${PV}/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE=""
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="${PYTHON_DEPS}
	games-emulation/caps
	media-libs/libsdl2[X,sound,video]
	media-libs/portaudio
	media-libs/portmidi
	sys-libs/readline:0=
	media-libs/libpng:0=
	sys-libs/zlib
"
DEPEND="${RDEPEND}
	virtual/pkgconfig
"
RDEPEND="${RDEPEND}
	dev-python/pygtk[${PYTHON_USEDEP}]
	>=games-emulation/emutos-0.9.9.1
"

DISABLE_AUTOFORMATTING="yes"
DOC_CONTENTS="
You need a TOS ROM to run hatari. EmuTOS, a free TOS implementation,
has been installed in /usr/lib*/hatari with a .img extension (there
are several from which to choose).
Another option is to go to http://www.atari.st/ and get a real TOS:
 http://www.atari.st/
The first time you run hatari, you should configure it to find the
TOS you prefer to use.  Be sure to save your settings.
"

src_prepare() {
	cmake-utils_src_prepare

	# build with newer zlib (bug #387829)
	sed -i -e '1i#define OF(x) x' src/includes/unzip.h || die

	sed -i -e '/Encoding/d' ./python-ui/hatariui.desktop || die
	sed -i -e "s/python/${EPYTHON}/" tools/atari-hd-image.sh || die
}

src_configure() {
	mycmakeargs=(
		"-DCMAKE_VERBOSE_MAKEFILE=TRUE"
		"-DCMAKE_BUILD_TYPE:STRING=Release"
		"-DDATADIR=/usr/share/${PN}"
		"-DENABLE_SDL2=1"
		"-DBIN2DATADIR=/usr/share/${PN}"
		"-DBINDIR=/usr/bin"
		"-DICONDIR=/usr/share/icons/hicolor"
		"-DMANDIR=/usr/share/man/man1"
		"-DDOCDIR=/usr/share/doc/${PF}"
		)
	cmake-utils_src_configure
}

src_install() {
	HTML_DOCS="doc/" DOCS="readme.txt doc/*.txt" cmake-utils_src_install
	readme.gentoo_create_doc
	python_fix_shebang "${ED%/}"/usr/share/hatari/{hatariui,hconsole}/
}

pkg_postinst() {
	readme.gentoo_print_elog
}
