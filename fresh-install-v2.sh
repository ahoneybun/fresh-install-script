#!/bin/bash
# Intro
# -------------
echo "-------------------------------"
distro="$(cat /etc/os-release | awk -F "\"" '/PRETTY_NAME/ {print $2}')"
echo "Welcome to your fresh" "${distro}"
echo "-------------------------------"

# Updating
# -------------
echo ""
echo "Let's make sure your sources are up to date"
echo "running apt update"
echo "-------------------------------"
sleep 3
sudo apt update
sleep 1
echo "Clearing the screen"
sleep 2
clear

# Upgrading
# -------------
echo "-------------------------------"
echo "Installing upgrades"
echo "running apt upgrade"
echo "-------------------------------"
sleep 3
sudo apt -k upgrade
sleep 1
echo "Clearing the screen"
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
echo -n "Enter choice: "; read option
case "$option" in
1)
    sudo apt install telegram-desktop
;;
*)

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
echo -n "Enter choice: "; read graphicschoice
   if [ "$graphicschoice" = "1" ]; then
    sudo apt install gimp
     elif [ "$graphicschoice" = "2" ]; then
      sudo apt install inkscape
# By default now you can't install a snap that is *not* signed, use with caution!
     elif [ "$graphicschoice" = "3" ]; then
      sudo apt install gimp inkscape
    elif [ "$graphicschoice" = "0"];then
      exit
  fi
sleep 1
clear

# Video and Audio selection
# --------------------------
echo "-------------------------------"
echo "Install your AV tools of choice"
echo ""
echo "[1] kdenlive"
echo "[1a] kdenlive PPA"
echo "[2] Audacity"
echo "[3] kdenlive & Audacity"
echo "[4] VLC"
echo "[0] Next"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read avchoice
    if [ "$avchoice" = "1" ]; then
     sudo apt install kdenlive
      elif [ "$avchoice" = "1a" ]; then
       sudo add-apt-repository ppa:kdenlive/kdenlive-stable
       sudo apt update
       sudo apt install kdenlive
      elif [ "$avchoice" = "2" ]; then
       sudo apt install audacity
      elif [ "$avchoice" = "3" ]; then
       sudo apt install kdenlive audacity
      elif [ "$avchoice" = "4" ]; then
       sudo apt install vlc
     elif [ "$avchoice" = "0"];then
       exit
    fi
sleep 1
clear

# Random useful tools
# -------------------
echo "-------------------------------"
echo "Installing some tools"
echo ""
echo "fish"

wget https://github.com/fish-shell/fish-shell/releases/download/3.0.0/fish-3.0.0.tar.gz
tar -xvf fish-3.0.0.tar.gz
cd fish-3.0.0/
./configure && make && sudo make install
echo /usr/local/bin/fish | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish

# Fixing dep issues
# and removing old packages
# --------------------------
sudo apt -f install
sudo apt autoremove
clear
echo "-------------------------------"
echo "Have a productive and happy day!"
echo "End of script"
echo "-------------------------------"
