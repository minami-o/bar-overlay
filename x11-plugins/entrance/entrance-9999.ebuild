# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: bar/x11-plugins/entrance/entrance-9999.ebuild,v 1.1 2012/12/23 12:02:10 -tclover Exp $

EAPI=5

ESVN_SUB_PROJECT="PROTO"
inherit enlightenment

DESCRIPTION="PAM compatible session manager, epigone of entrance"

IUSE="static-libs"

DEPEND=">=dev-libs/ecore-1.0
	>=dev-libs/eet-1.4.0
	>=dev-libs/eina-1.0
	>=media-libs/edje-1.0
	>=media-libs/evas-1.0
	|| ( media-libs/elementary >=x11-libs/elementary-0.5 )"
RDEPEND="virtual/pam
	consolekit? ( sys-auth/consolekit )
	grub2? ( sys-boot/grub:2 )"

IUSE="consolekit grub2"

src_configure() {
	export MY_ECONF="
		$(use_enable consolekit consolekit)
		$(use_enable grub2 grub2)
	"
	enlightenment_src_configure
}

pkg_postinst(){
	use grub2 && einfo "do not forget to add this line 'GRUB_DEFAULT=saved' to /etc/default/grub"
}
