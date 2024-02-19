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
		echo
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

function_plasma() {
	list=(
		bluedevil
		breeze
		breeze-gtk
		breeze-plymouth
		discover
		drkonqi
		flatpak-kcm
		kactivitymanagerd
		kde-cli-tools
		kde-gtk-config
		kdecoration
		kdeplasma-addons
		kgamma
		khotkeys
		kinfocenter
		kmenuedit
		kpipewire
		kscreen
		kscreenlocker
		ksshaskpass
		ksystemstats
		kwallet-pam
		kwayland-integration
		kwin
		kwrited
		layer-shell-qt
		libkscreen
		libksysguard
		milou
		oxygen
		oxygen-sounds
		plasma-browser-integration
		plasma-desktop
		plasma-disks
		plasma-firewall
		plasma-integration
		plasma-nm
		plasma-pa
		plasma-sdk
		plasma-systemmonitor
		plasma-thunderbolt
		plasma-vault
		plasma-welcome
		plasma-workspace
		plasma-workspace-wallpapers
		plymouth-kcm
		polkit-kde-agent
		powerdevil
		sddm-kcm
		systemsettings
		xdg-desktop-portal-kde
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

	echo
	tput setaf 6
	echo "######################################################################################################"
	echo "Software has been installed"
	echo "######################################################################################################"
	tput sgr0
}

###############################################################################

echo
tput setaf 4
echo "######################################################################################################"
echo "> Installation of KDE PLASMA desktop environment"
echo "######################################################################################################"
tput sgr0
echo "######################################################################################################"
echo "Choose plasma-desktop or plasma-meta or plasma group to install"
echo "######################################################################################################"

echo "Select the correct number:"
echo "1) plasma-desktop"
echo "2) plasma-meta"
echo "3) plasma"
read -erp "Enter the number... " CHOICE

case ${CHOICE} in

1)
	tput setaf 3
	echo "######################################################################################################"
	echo "plasma-desktop to be installed..."
	echo "######################################################################################################"
	echo
	tput sgr0

	sudo pacman -S --noconfirm --needed plasma-desktop dolphin kate konsole sddm
	;;
2)
	tput setaf 3
	echo "######################################################################################################"
	echo "plasma-meta to be installed..."
	echo "######################################################################################################"
	echo
	tput sgr0

	sudo pacman -S --noconfirm --needed plasma-meta dolphin kate konsole sddm
	;;
3)
	tput setaf 3
	echo "######################################################################################################"
	echo "plasma group to be installed..."
	echo "######################################################################################################"
	echo
	tput sgr0

	function_plasma
	sudo pacman -S --noconfirm --needed dolphin kate konsole sddm
	;;
*)
	tput setaf 1
	echo "######################################################################################################"
	echo "Choose the correct number"
	echo "######################################################################################################"
	echo
	tput sgr0
	;;
esac

###############################################################################

echo
tput setaf 5
echo "######################################################################################################"
echo "Copying all files and folders from /etc/skel to ~"
echo "######################################################################################################"
echo
tput sgr0

BACKUP_DATE="$(date +%Y.%m.%d-%H.%M.%S)"

cp -Rf ~/.config ~/.config-backup-"${BACKUP_DATE}"
cp -arf /etc/skel/. ~

echo
tput setaf 5
echo "######################################################################################################"
echo "Enabling sddm as display manager"
echo "######################################################################################################"
echo
tput sgr0

sudo systemctl enable sddm.service -f

echo
tput setaf 5
echo "######################################################################################################"
echo "Creating user directories"
echo "######################################################################################################"
echo
tput sgr0

sudo pacman -S --noconfirm --needed xdg-utils xdg-user-dirs

echo
tput setaf 6
echo "######################################################################################################"
echo "You now have a very minimal functional desktop"
echo "######################################################################################################"
tput sgr0
tput setaf 1
echo "######################################################################################################"
echo "Reboot your system!"
echo "######################################################################################################"
echo
tput sgr0
