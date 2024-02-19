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
echo "> Installation of kde-applications group"
echo "######################################################################################################"
tput sgr0

list=(
	akonadi-calendar-tools
	akonadi-import-wizard
	akonadiconsole
	akregator
	alligator
	angelfish
	arianna
	ark
	artikulate
	audiocd-kio
	audiotube
	blinken
	bomber
	bovo
	cantor
	cervisia
	colord-kde
	dolphin
	dolphin-plugins
	dragon
	elisa
	falkon
	ffmpegthumbs
	filelight
	ghostwriter
	granatier
	grantlee-editor
	gwenview
	itinerary
	juk
	k3b
	kaddressbook
	kajongg
	kalarm
	kalgebra
	kalk
	kalzium
	kamera
	kamoso
	kanagram
	kapman
	kapptemplate
	kasts
	kate
	katomic
	kbackup
	kblackbox
	kblocks
	kbounce
	kbreakout
	kbruch
	kcachegrind
	kcalc
	kcharselect
	kclock
	kcolorchooser
	kcron
	kde-dev-scripts
	kde-dev-utils
	kde-inotify-survey
	kdebugsettings
	kdeconnect
	kdegraphics-thumbnailers
	kdenetwork-filesharing
	kdenlive
	kdepim-addons
	kdesdk-kio
	kdesdk-thumbnailers
	kdevelop
	kdevelop-php
	kdevelop-python
	kdf
	kdialog
	kdiamond
	keditbookmarks
	keysmith
	kfind
	kfourinline
	kgeography
	kget
	kgoldrunner
	kgpg
	khangman
	khelpcenter
	kig
	kigo
	killbots
	kimagemapeditor
	kio-admin
	kio-extras
	kio-gdrive
	kio-zeroconf
	kirigami-gallery
	kiriki
	kiten
	kjournald
	kjumpingcube
	kleopatra
	klettres
	klickety
	klines
	kmag
	kmahjongg
	kmail
	kmail-account-wizard
	kmines
	kmix
	kmousetool
	kmouth
	kmplot
	knavalbattle
	knetwalk
	knights
	knotes
	koko
	kolf
	kollision
	kolourpaint
	kompare
	kongress
	konqueror
	konquest
	konsole
	kontact
	kontrast
	konversation
	kopete
	korganizer
	kpat
	krdc
	krecorder
	kreversi
	krfb
	kruler
	kshisen
	ksirk
	ksnakeduel
	kspaceduel
	ksquares
	ksudoku
	ksystemlog
	kteatime
	ktimer
	ktorrent
	ktouch
	ktrip
	ktuberling
	kturtle
	kubrick
	kwalletmanager
	kwave
	kweather
	kwordquiz
	lokalize
	lskat
	marble
	markdownpart
	mbox-importer
	merkuro
	minuet
	neochat
	okular
	palapeli
	parley
	partitionmanager
	picmi
	pim-data-exporter
	pim-sieve-editor
	plasmatube
	poxml
	print-manager
	rocs
	signon-kwallet-extension
	skanlite
	skanpage
	skladnik
	spectacle
	step
	svgpart
	sweeper
	telly-skout
	tokodon
	umbrello
	xwaylandvideobridge
	yakuake
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

echo
tput setaf 6
echo "######################################################################################################"
echo "Software has been installed"
echo "######################################################################################################"
echo
tput sgr0
