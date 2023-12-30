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
		"${aur_command}" -S --noconfirm --needed "$1"
	fi
}

func_category() {
	echo
	tput setaf 4
	echo "######################################################################################################"
	echo "Installing software for category '$1'"
	echo "######################################################################################################"
	tput sgr0
}

###############################################################################

echo
tput setaf 4
echo "######################################################################################################"
echo "Installing AUR helpers"
echo "######################################################################################################"
tput sgr0

# Define AUR array
AUR=("yay" "yay-bin" "paru" "paru-bin" "trizen" "pikaur" "pakku" "aurman" "aura")

# Print AUR array in multiple columns
num_columns=2
num_aur=${#AUR[@]}
num_rows=$(((num_aur + num_columns - 1) / num_columns))
for ((i = 0; i < num_rows; i++)); do
	for ((j = 0; j < num_columns; j++)); do
		index=$((j * num_rows + i))
		if ((index < num_aur)); then
			printf "%-2d) %-25s" "$((index + 1))" "${AUR[index]}"
		fi
	done
	echo
done

# Prompt user to select AUR
tput setaf 5
echo "#############################################"
echo ":: Please enter your desired AUR helper(s):"
echo "   (enter numbers separated by spaces)"
echo "#############################################"
tput sgr0

read -er aur_nums_str

# Convert user input to array of AUR names
IFS=' ' read -ra aur_nums <<<"${aur_nums_str}"

# Check if any valid AUR numbers were selected
invalid_selection=0
selected_aur=()

for num in "${aur_nums[@]}"; do
	if ((num < 1 || num > ${#AUR[@]})); then
		tput setaf 1
		echo "######################################################################################################"
		echo "################# Invalid selection: ${num}"
		echo "################# Try again. Enter the correct number(s)"
		echo "######################################################################################################"
		tput sgr0

		invalid_selection=1
		exec "${0}"
		exit $?
	else
		selected_aur+=("${AUR[num - 1]}")
	fi
done

if ((invalid_selection == 0)); then
	tput setaf 13
	echo "########################"
	echo " AUR to be installed..."
	echo "########################"
	echo "* ${selected_aur[0]}"

	for ((i = 1; i < ${#selected_aur[@]}; i++)); do
		echo "* ${selected_aur[i]}"
	done

	echo "########################"
	echo
	tput sgr0

	# Install dependencies
	sudo pacman -S --noconfirm --needed base-devel git

	for aur in "${selected_aur[@]}"; do
		if pacman -Qi "${aur}" &>/dev/null; then
			tput setaf 2
			echo "######################################################################################################"
			echo "################# '${aur}' is already installed"
			echo "######################################################################################################"
			tput sgr0
		else
			echo
			tput setaf 3
			echo "######################################################################################################"
			echo "################# Installing '${aur}'..."
			echo "######################################################################################################"
			echo
			tput sgr0
			(
				git clone "https://aur.archlinux.org/${aur}.git" "/tmp/${aur}"
				cd "/tmp/${aur}" || exit 1
				makepkg -si --noconfirm --needed
			)
		fi
	done

	if command -v yay >/dev/null 2>&1; then
		aur_command="yay"
	elif command -v paru >/dev/null 2>&1; then
		aur_command="paru"
	elif command -v trizen >/dev/null 2>&1; then
		aur_command="trizen"
	elif command -v pikaur >/dev/null 2>&1; then
		aur_command="pikaur"
	elif command -v pakku >/dev/null 2>&1; then
		aur_command="pakku"
	elif command -v aurman >/dev/null 2>&1; then
		aur_command="aurman"
	elif command -v aura >/dev/null 2>&1; then
		aur_command="sudo aura"
	fi
fi

###############################################################################

func_category Any_software_from_AUR

list=(
	archlinux-tweak-tool-git
	arc-kde-git
	brave-bin
	hardcode-fixer-git
	librewolf-bin
	vscodium-bin
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

echo "[*] Fixing hardcoded icon paths for applications - Wait for it..."
sudo hardcode-fixer

###############################################################################

echo
tput setaf 6
echo "######################################################################################################"
echo "Software has been installed"
echo "######################################################################################################"
echo
tput sgr0
