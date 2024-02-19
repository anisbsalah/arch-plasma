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

func_category kde-accessibility

list=(
	kmag
	kmousetool
	kmouth
	kontrast
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

func_category kde-education

list=(
	artikulate
	blinken
	cantor
	kalgebra
	kalzium
	kanagram
	kbruch
	kgeography
	khangman
	kig
	kiten
	klettres
	kmplot
	ktouch
	kturtle
	kwordquiz
	marble
	minuet
	parley
	rocs
	step
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

func_category kde-games

list=(
	bomber
	bovo
	granatier
	kajongg
	kapman
	katomic
	kblackbox
	kblocks
	kbounce
	kbreakout
	kdiamond
	kfourinline
	kgoldrunner
	kigo
	killbots
	kiriki
	kjumpingcube
	klickety
	klines
	kmahjongg
	kmines
	knavalbattle
	knetwalk
	knights
	kolf
	kollision
	konquest
	kpat
	kreversi
	kshisen
	ksirk
	ksnakeduel
	kspaceduel
	ksquares
	ksudoku
	ktuberling
	kubrick
	lskat
	palapeli
	picmi
	skladnik
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

func_category kde-graphics

list=(
	arianna
	colord-kde
	gwenview
	kamera
	kcolorchooser
	kdegraphics-thumbnailers
	kimagemapeditor
	koko
	kolourpaint
	kruler
	okular
	skanlite
	spectacle
	svgpart
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

func_category kde-multimedia

list=(
	audiocd-kio
	audiotube
	dragon
	elisa
	ffmpegthumbs
	juk
	k3b
	kamoso
	kasts
	kdenlive
	kmix
	kwave
	plasmatube
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

func_category kde-network

list=(
	alligator
	angelfish
	falkon
	kdeconnect
	kdenetwork-filesharing
	kget
	kio-extras
	kio-gdrive
	kio-zeroconf
	konqueror
	konversation
	kopete
	krdc
	krfb
	ktorrent
	neochat
	signon-kwallet-extension
	tokodon
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

func_category kde-office

list=(
	ghostwriter
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

func_category kde-pim

list=(
	akonadi-calendar-tools
	akonadi-import-wizard
	akonadiconsole
	akregator
	grantlee-editor
	itinerary
	kaddressbook
	kalarm
	kdepim-addons
	kleopatra
	kmail
	kmail-account-wizard
	knotes
	kontact
	korganizer
	mbox-importer
	merkuro
	pim-data-exporter
	pim-sieve-editor
	zanshin
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

func_category kdesdk

list=(
	cervisia
	dolphin-plugins
	kapptemplate
	kcachegrind
	kde-dev-scripts
	kde-dev-utils
	kdesdk-kio
	kdesdk-thumbnailers
	kirigami-gallery
	kompare
	lokalize
	poxml
	umbrello
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

func_category kde-system

list=(
	dolphin
	kcron
	kde-inotify-survey
	khelpcenter
	kio-admin
	kjournald
	ksystemlog
	partitionmanager
	xwaylandvideobridge
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

func_category kde-utilities

list=(
	ark
	filelight
	kalk
	kate
	kbackup
	kcalc
	kcharselect
	kdebugsettings
	kdf
	kdialog
	keditbookmarks
	keysmith
	kfind
	kgpg
	kongress
	konsole
	krecorder
	kteatime
	ktimer
	ktrip
	kwalletmanager
	kweather
	markdownpart
	print-manager
	skanpage
	sweeper
	telly-skout
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

func_category kdevelop

list=(
	kdevelop
	kdevelop-php
	kdevelop-python
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
