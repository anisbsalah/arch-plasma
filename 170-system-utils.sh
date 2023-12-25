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

echo
tput setaf 4
echo "######################################################################################################"
echo "Installation of System Utils"
echo "######################################################################################################"
tput sgr0

list=(
	arj
	bash-completion
	cabextract
	cifs-utils
	cronie
	#cryfs
	dosfstools
	e2fsprogs
	#encfs
	exfat-utils
	filelight
	file-roller
	#gocryptfs
	gvfs
	gvfs-afc
	gvfs-gphoto2
	gvfs-mtp
	gvfs-nfs
	gvfs-smb
	libx11
	libxft
	libxinerama
	man-db
	man-pages
	mtools
	mtpfs
	nfs-utils
	nilfs-utils
	ntfs-3g
	os-prober
	partclone
	partimage
	p7zip
	reflector
	rsync
	sharutils
	squashfs-tools
	sshfs
	texinfo
	udiskie
	udisks2
	unace
	unarchiver
	unrar
	unzip
	usbutils
	uudeview
	xdg-utils
	xdg-user-dirs
	xz
	zip
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
