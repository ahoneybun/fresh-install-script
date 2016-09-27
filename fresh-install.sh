#!/bin/bash
# Intro
# -------------
echo "-------------------------------"
echo "Welcome to your fresh" 
awk 'FNR==2' /etc/os-release
echo "-------------------------------"

# apt update
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

# apt upgrade
# -------------
echo "-------------------------------"
echo "Installing upgrades"
echo "running apt upgrade"
echo "-------------------------------"
sudo -k apt upgrade
sleep 1
clear

# Checking if snapd is install, if not it will install it
# -------------
   if [ $(dpkg-query -W -f='${Status}' snapd 2>/dev/null | grep -c "ok installed") -eq 0 ];
      then
	echo ""
	echo "First we have to install the necessary tools:"
	echo ""
	echo "  → snapd"
	echo ""
	  sudo apt-get install -qq -y snapd;
   fi

# Browser selection
# -------------
echo "-------------------------------"
echo "Install your browser of choice"
echo ""
echo "[1] Chrome"
echo "[2] Chromuim"
echo "[3] Vivaldi"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read browserchoice
   if [ "$browserchoice" = "1" ]; then 
     wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
     sudo dpkg -i google-chrome-stable_current_amd64.deb
     sudo apt -f install
    elif [ "$browserchoice" = "2" ]; then
     sudo -k apt install chromium-browser
    elif [ "$browserchoice" = "3" ]; then
     wget https://downloads.vivaldi.com/stable/vivaldi-stable_1.3.551.38-1_amd64.deb 
     sudo dpkg -i vivaldi-stable_1.3.551.38-1_amd64.deb
   fi
sleep 1
clear

# Graphics selection
# -------------
echo "-------------------------------"
echo "Install your graphics software of choice"
echo ""
echo "[1] GIMP"
echo "[2] Inkscape"
echo "[3] Inkscape snap (WIP)"
echo "[4] Install all as Ubuntu/Debian packages"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read graphicschoice
   if [ "$graphicschoice" = "1" ]; then
    sudo apt install gimp
     elif [ "$graphicschoice" = "2" ]; then
      sudo apt install inkscape
# By default now you can't install a snap that is *not* signed, use with caution!
      elif [ "$graphicschoice" = "3" ]; then
echo "Installing inkscape snap with force as it is *not* signed"
       wget https://launchpad.net/~inkscape-uploader/+snap/inkscape/+build/4986/+files/inkscape_0.91+devel_amd64.snap
       sudo snap install --force-dangerous inkscape_0.91+devel_amd64.snap
     elif [ "$graphicschoice" = "4" ]; then
      sudo apt install gimp inkscape
  fi
sleep 1
clear

# Office selection
# -------------
echo "-------------------------------"
echo "Install your office suite of choice"
echo ""
echo "[1] Calligra"
echo "[2] LibreOffice"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read officechoice
   if [ "$officechoice" = "1" ]; then
    sudo apt install calligra
     elif [ "$officechoice" = "2" ]; then
      sudo apt install libreoffice
   fi
sleep 1
clear

# Development tools
# -------------
echo "-------------------------------"
echo "Dev tools"
echo ""
echo "GitKraken"
wget https://release.gitkraken.com/linux/gitkraken-amd64.deb -O gitkraken.deb
sudo dpkg -i gitkraken.deb

# Random useful tools
# -------------
echo "-------------------------------"
echo "Installing some tools"
echo ""
echo "pastebinit, git, bzr, virtualbox, rememberthemilk"
sudo apt install pastebinit git bzr

# Downloading virtualbox and rememberthemilk
  wget http://download.virtualbox.org/virtualbox/5.1.6/virtualbox-5.1_5.1.6-110634~Ubuntu~xenial_amd64.deb
  wget https://www.rememberthemilk.com/download/linux/debian/pool/main/r/rememberthemilk/rememberthemilk-1.1.1.deb
# Installing virtualbox and rememberthemilk
   sudo dpkg -i virtualbox-5.1_5.1.6-110634~Ubuntu~xenial_amd64.deb
   sudo dpkg -i rememberthemilk-1.1.1.deb
sleep 1
clear
echo "-------------------------------"
echo "Have a productive and happy day!"
echo "End of script"
echo "-------------------------------"
