#!/bin/bash
# Intro
# -------------
echo "------------------------------------------------------------------"
distro="$(cat /etc/os-release | awk -F "\"" '/PRETTY_NAME/ {print $2}')"
echo "Welcome to your fresh" "${distro}"
echo "------------------------------------------------------------------"

# Updating
# -------------
echo ""
echo "--------------------------------------------"
echo "Let's make sure your sources are up to date"
echo "running apt update"
echo "--------------------------------------------"
sleep 3
sudo apt update
sleep 1
echo "*Clearing the screen*"
sleep 2
clear

# Upgrading
# -------------
echo "-------------------------------"
echo "Installing upgrades"
echo "running apt upgrade"
echo "-------------------------------"
sleep 3
sudo -k apt upgrade
sleep 1
echo "*Clearing the screen*"
sleep 2
clear


# Communication Tools
# --------------------
echo "-------------------------------"
echo "Install your communication tools of choice"
echo ""
echo "[1] Telegram"
echo "[0] Next"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read commoption
case "$commoption" in
1) sudo apt install telegram-desktop
   ;;
*) echo "Next option";;
esac
sleep 1
clear

# Graphics selection
# -------------------
echo "-------------------------------"
echo "Install your graphics software of choice"
echo ""
echo "[1] GIMP"
echo "[2] Inkscape"
echo "[3] All"
echo "[0] Next"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read graphicoption
case "$graphicoption" in
1) sudo apt install gimp
   ;;
2) sudo apt install inkscape
   ;;
3) sudo apt install gimp inkscape
   ;;
*) echo "Next option";;
esac
sleep 1
clear

# Random useful tools
# -------------------
echo "-------------------------------"
echo "Installing some tools"
echo ""
echo "fish and virtualbox"
echo "-------------------------------"
echo ""
wget https://github.com/fish-shell/fish-shell/releases/download/3.0.0/fish-3.0.0.tar.gz
tar -xvf fish-3.0.0.tar.gz
cd fish-3.0.0/
./configure && make && sudo make install
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

wget https://download.virtualbox.org/virtualbox/6.0.0/virtualbox-6.0_6.0.0-127566~Ubuntu~bionic_amd64.deb
sudo dpkg -i virtualbox-6.0_6.0.0-127566~Ubuntu~bionic_amd64.deb

# Fixing dep issues
# and removing old packages
# --------------------------
echo "-------------------------------------"
echo "Now let's clean up some dependencies"
echo "-------------------------------------"
echo ""
sudo apt -f install
sudo apt autoremove
rm -r fish-3.0.0 && rm -r fish-3.0.0.tar.gz
rm virtualbox-6.0_6.0.0-127566~Ubuntu~bionic_amd64.deb
clear
echo "---------------------------------"
echo "Have a productive and happy day!"
echo "End of script"
echo "---------------------------------"
