#!/bin/bash
#set -e
##################################################################################################################
# Author  :  anisbsalah
# Github  :  https://github.com/anisbsalah
##################################################################################################################
#
# DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
##################################################################################################################
#
# DECLARATION OF FUNCTIONS
#
##################################################################################################################

func_install() {
	if pacman -Qi "$1" &>/dev/null; then
		tput setaf 2
		echo "######################################################################################################"
		echo "################# The package '$1' is already installed"
		echo "######################################################################################################"
		tput sgr0
	else
		tput setaf 11
		echo "######################################################################################################"
		echo "################# Installing $1..."
		echo "######################################################################################################"
		echo
		tput sgr0
		sudo pacman -S --noconfirm --needed "$1"
	fi
}

func_category() {
	echo
	tput setaf 4
	echo "######################################################################################################"
	echo "> Installing software for category '$1'"
	echo "######################################################################################################"
	tput sgr0
}

###############################################################################

func_category Additional-distro-specific

list=(
	# kde-accessibility-meta
	# kde-applications-meta
	# kde-development-environment-meta
	# kde-education-meta
	# kde-games-meta
	# kde-graphics-meta
	# kde-multimedia-meta
	# kde-network-meta
	# kde-office-meta
	# kde-pim-meta
	# kde-sdk-meta
	# kde-system-meta
	# kde-utilities-meta
	# kdevelop-meta
	ark
	audiocd-kio
	dolphin
	dolphin-plugins
	extra-cmake-modules
	ffmpegthumbs
	ghostwriter
	gwenview
	kate
	kcodecs
	kcoreaddons
	kcron
	kdeconnect
	kdegraphics-thumbnailers
	kdenetwork-filesharing
	kdialog
	kimageformats
	kinit
	kio-fuse
	kompare
	konsole
	libksysguard
	networkmanager-qt5
	okular
	packagekit-qt6
	partitionmanager
	plasma-wayland-protocols
	print-manager
	solid
	spectacle
	svgpart
	xsettingsd
	xwaylandvideobridge
	yakuake
)

count=0
for name in "${list[@]}"; do
	count=$((count + 1))
	echo
	tput setaf 3
	echo "Package nr. ${count}) ${name}"
	tput sgr0
	func_install "${name}"
done

###############################################################################

echo
tput setaf 6
echo "######################################################################################################"
echo "Software has been installed"
echo "######################################################################################################"
echo
tput sgr0
