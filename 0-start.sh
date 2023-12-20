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

clear
echo "
██╗  ██╗██████╗ ███████╗    ██████╗ ██╗      █████╗ ███████╗███╗   ███╗ █████╗ 
██║ ██╔╝██╔══██╗██╔════╝    ██╔══██╗██║     ██╔══██╗██╔════╝████╗ ████║██╔══██╗
█████╔╝ ██║  ██║█████╗      ██████╔╝██║     ███████║███████╗██╔████╔██║███████║
██╔═██╗ ██║  ██║██╔══╝      ██╔═══╝ ██║     ██╔══██║╚════██║██║╚██╔╝██║██╔══██║
██║  ██╗██████╔╝███████╗    ██║     ███████╗██║  ██║███████║██║ ╚═╝ ██║██║  ██║
╚═╝  ╚═╝╚═════╝ ╚══════╝    ╚═╝     ╚══════╝╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚═╝  ╚═╝
"
./100-xorg.sh |& tee 100-xorg.log
./110-drivers.sh |& tee 110-drivers.log
./120-networking.sh |& tee 120-networking.log
./130-sound.sh |& tee 130-sound.log
./140-bluetooth.sh |& tee 140-bluetooth.log
./150-printers.sh |& tee 150-printers.log
./160-laptop.sh |& tee 160-laptop.log
./170-system-utils.sh |& tee 170-system-utils.log
./180-fonts.sh |& tee 180-fonts.log
./200-plasma.sh |& tee 200-plasma.log
./210-plasma-specific-software.sh |& tee 210-plasma-specific-software.log
./300-software-arch-linux.sh |& tee 300-software-arch-linux.log
./400-software-AUR.sh |& tee 400-software-AUR.log
# ./500-software-arcolinux.sh |& tee 500-software-arcolinux.log
# ./510-additional-arcolinux-software.sh |& tee 510-additional-arcolinux-software.log
