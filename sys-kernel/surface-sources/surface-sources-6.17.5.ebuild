EAPI="8"
ETYPE="sources"
K_SECURITY_UNSUPPORTED="1"
K_WANT_GENPATCHES="base extras experimental"
K_GENPATCHES_VER="8"

inherit kernel-2
detect_version
detect_arch

KEYWORDS="~amd64 ~x86 ~arm64"
HOMEPAGE="https://github.com/linux-surface/linux-surface"
IUSE="experimental"

DESCRIPTION="Full sources including the Gentoo patchset and Surface patchset for the ${KV_MAJOR}.${KV_MINOR} kernel tree"
SRC_URI="${KERNEL_URI} ${GENPATCHES_URI} ${ARCH_URI}"

src_prepare() {
	eapply "${FILESDIR}/6.17/0001-secureboot.patch"
	eapply "${FILESDIR}/6.17/0002-surface3.patch"
	eapply "${FILESDIR}/6.17/0003-mwifiex.patch"
	eapply "${FILESDIR}/6.17/0004-ath10k.patch"
	eapply "${FILESDIR}/6.17/0005-ipts.patch"
	eapply "${FILESDIR}/6.17/0006-ithc.patch"
	eapply "${FILESDIR}/6.17/0007-surface-sam.patch"
	eapply "${FILESDIR}/6.17/0008-surface-sam-over-hid.patch"
	eapply "${FILESDIR}/6.17/0009-surface-button.patch"
	eapply "${FILESDIR}/6.17/0010-surface-typecover.patch"
	eapply "${FILESDIR}/6.17/0011-surface-shutdown.patch"
	eapply "${FILESDIR}/6.17/0012-surface-gpe.patch"
	eapply "${FILESDIR}/6.17/0013-cameras.patch"
	eapply "${FILESDIR}/6.17/0014-amd-gpio.patch"
	eapply "${FILESDIR}/6.17/0015-rtc.patch"
	eapply_user
}

pkg_setup() {
	ewarn ""
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the overlay developers directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn ""
}

pkg_postinst() {
	kernel-2_pkg_postinst
	einfo "For more info on this patchset, see:"
	einfo "${HOMEPAGE}"
}

pkg_postrm() {
	kernel-2_pkg_postrm
}
