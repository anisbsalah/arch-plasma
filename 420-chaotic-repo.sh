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

if ! grep -q chaotic /etc/pacman.conf; then

	echo
	tput setaf 4
	echo "######################################################################################################"
	echo "> Installing the keyring and mirrorlist for Chaotic-AUR"
	echo "######################################################################################################"
	echo
	tput sgr0

	tput setaf 3
	echo "[*] Getting the primary key for Chaotic-AUR..."
	tput sgr0
	echo
	sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
	sudo pacman-key --lsign-key 3056513887B78AEB

	echo
	tput setaf 3
	echo "[*] Getting the chaotic keyring..."
	tput sgr0
	echo
	sudo pacman -U --noconfirm --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst'

	echo
	tput setaf 3
	echo "[*] Getting the chaotic mirrorlist..."
	tput sgr0
	echo
	sudo pacman -U --noconfirm --needed 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'

	echo
	tput setaf 3
	echo "[*] Activating the Chaotic-AUR repo..."
	tput sgr0
	echo '

[chaotic-aur]
SigLevel = Required DatabaseOptional
Include = /etc/pacman.d/chaotic-mirrorlist' | sudo tee --append /etc/pacman.conf

	echo
	tput setaf 3
	echo "######################################################################################################"
	echo "Updating database..."
	echo "######################################################################################################"
	echo
	tput sgr0

	sudo pacman -Sy

	echo
	tput setaf 2
	echo "######################################################################################################"
	echo "Chaotic-AUR keyring and mirrorlist added successfully"
	echo "######################################################################################################"
	echo
	tput sgr0

else
	exit 0
fi
