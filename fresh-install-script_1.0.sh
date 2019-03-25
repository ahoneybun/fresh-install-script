#!/bin/bash
# Intro
# -------------
clear
echo "------------------------------------------------------------------"
echo "Welcome to version 2.0 of the FIS"
distro="$(cat /etc/os-release | awk -F "\"" '/PRETTY_NAME/ {print $2}')"
echo "Welcome to your fresh" "${distro}"
echo "------------------------------------------------------------------"
sleep 2
clear

# Updating
# -------------
echo "--------------------------------------------"
echo "Let's make sure your sources are up to date"
echo "running apt update"
echo "--------------------------------------------"
sudo apt update
sleep 2
clear

# Upgrading
# -------------
echo "-------------------------------"
echo "Installing upgrades"
echo "running apt upgrade"
echo "-------------------------------"
sudo -k apt upgrade
sleep 2
clear

echo "---------------------------------"
echo "Restoring files from ExtraDrive1"
echo "---------------------------------"

# Setting username for path logic
read -p 'Username: ' uservar

echo "--------------------------------"
echo "Mounting your ExtraDrive1"
echo "--------------------------------"

sudo mount /media/$uservar/ExtraDrive1
sudo mount /dev/sda1 /media/$uservar/ExtraDrive1

cp -r /media/$uservar/ExtraDrive1/Backups/Pictures/* /home/$uservar/Pictures/
cp -r /media/$uservar/ExtraDrive1/Backups/Documents/* /home/$uservar/Documents/
cp -r /media/$uservar/ExtraDrive1/Backups/.ssh/* /home/$uservar/.ssh/
cp -r /media/$uservar/ExtraDrive1/Backups/.config/i3/* /home/$uservar/.config/i3/
cp -r /media/$uservar/ExtraDrive1/Backups/.config/i3status/* /home/$uservar/.config/i3status/
cp -r /media/$uservar/ExtraDrive1/Backups/.config/sway/* /home/$uservar/.config/sway/

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
echo "fish (gcc, make, g++, libncurses5), virtualbox and Chrome, Tilix"
echo "-------------------------------"
echo ""
sudo apt install gcc make g++ libncurses5-dev
wget https://github.com/fish-shell/fish-shell/releases/download/3.0.0/fish-3.0.0.tar.gz
tar -xvf fish-3.0.0.tar.gz
cd fish-3.0.0/
./configure && make && sudo make install
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

wget https://download.virtualbox.org/virtualbox/6.0.0/virtualbox-6.0_6.0.0-127566~Ubuntu~bionic_amd64.deb
sudo dpkg -i virtualbox-6.0_6.0.0-127566~Ubuntu~bionic_amd64.deb

wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# Fixing dep issues
# and removing old packages
# --------------------------
echo "-------------------------------------"
echo "Now let's clean up some dependencies"
echo "and some left over files"
echo "-------------------------------------"
echo ""
sudo apt -f install
sudo apt autoremove
rm -r fish-3.0.0 && rm -r fish-3.0.0.tar.gz
rm virtualbox-6.0_6.0.0-127566~Ubuntu~bionic_amd64.deb
rm google-chrome-stable_current_amd64.deb
clear

echo "---------------------------------"
echo "Have a productive and happy day!"
echo "End of script"
echo "---------------------------------"


