# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: bar/x11-plugins/e_modules-eweather/e_modules-eweather-9999.ebuild,v 1.1 2012/12/23 11:42:01 -tclover Exp $

EAPI=5

ESVN_SUB_PROJECT="E-MODULES-EXTRA"
ESVN_URI_APPEND="${PN#e_modules-}"

inherit enlightenment

DESCRIPTION="EWeather gadget for e17"

LICENSE="LGPL-2.1"

DEPEND="x11-wm/enlightenment:0.17
	>=net-libs/libeweather-9999
	>=media-libs/edje-0.5.0"
