# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: media-sound/a2jmidid/a2jmidid-9999.ebuild, 1.1 2014/10/10 -tclover Exp $

EAPI=5

PYTHON_COMPAT=( python2_7 )

inherit python-single-r1 waf-utils git-2

DESCRIPTION="Daemon for exposing legacy ALSA sequencer applications in JACK MIDI system"
HOMEPAGE="http://home.gna.org/a2jmidid/"
EGIT_REPO_URI="git://repo.or.cz/${PN}.git"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE="dbus"

RDEPEND="media-libs/alsa-lib
	media-sound/jack-audio-connection-kit
	dbus? ( sys-apps/dbus )"
DEPEND="${RDEPEND}
	virtual/pkgconfig"

DOCS=( AUTHORS NEWS README internals.txt )

src_configure()
{
	local -a mywafconfargs=(
		$(usex dbus '' --disable-dbus)
	)
	NO_WAF_LIBDIR=1 waf-utils_src_configure "${mywafconfargs[@]}"
}

src_install()
{
	waf-utils_src_install
	python_fix_shebang "${ED}"
}

