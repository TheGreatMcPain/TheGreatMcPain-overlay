# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Post-processing shaders written in the ReShade FX shader language"
HOMEPAGE="https://github.com/crosire/reshade-shaders"

PV_COMMIT=a621b3f4f154e4a1ba8e07d63827e1e757a05bbd
SRC_URI="https://github.com/crosire/reshade-shaders/archive/${PV_COMMIT}.zip -> reshade-shaders-${PV}.zip"

# Since reshade is under BSD I'm going to assume BSD, because
# there's no license in the github-repo.
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"

S="${WORKDIR}/reshade-shaders-${PV_COMMIT}"

src_install() {
	insinto "/usr/share/${PN}"

	doins -r "${S}/Shaders"
	doins -r "${S}/Textures"

	dodoc "${S}/REFERENCE.md"
	dodoc "${S}/README.md"
}
