#!/bin/bash
echo "-------------------------------"
echo "Welcome to your fresh "
awk 'FNR==2' /etc/os-release 
echo "-------------------------------"
echo ""
echo "Let's make sure your sources are up to date"
echo "running apt update"
echo "-------------------------------"
sleep 3
clear
sudo apt update
sleep 1
echo "Clearing the screen"
sleep 2
clear
echo "-------------------------------"
echo "Installing upgrades"
echo "running apt upgrade"
echo "-------------------------------"
sudo -k apt upgrade
sleep 1
clear
	if [ $(dpkg-query -W -f='${Status}' mplayer 2>/dev/null | grep -c "ok installed") -eq 0 ];
	then
	  echo ""
	  echo "First we have to install the necessary tools:"
	  echo ""
	  echo "  → snapd"
	  echo ""
	  sudo apt-get install -qq -y snapd;
	fi
echo "-------------------------------"
echo "Install your browser of choice"
echo ""
echo "[1] Chrome WIP"
echo "[2] Chromuim"
echo "[3] Vivaldi"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read browserchoice
if [ "$browserchoice" = "2" ]; then
sudo -k apt install chromium-browser
elif [ "$browserchoice" = "3" ]; then
wget https://downloads.vivaldi.com/stable/vivaldi-stable_1.3.551.38-1_amd64.deb 
sudo dpkg -i vivaldi-stable_1.3.551.30-1_amd64.deb
fi
sleep 1
clear
echo "-------------------------------"
echo "Install your graphics software of choice"
echo ""
echo "[1] GIMP"
echo "[2] Inkscape"
echo "[3] Inkscape snap"
echo "[4] Install all"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read graphicschoice
if [ "$graphicschoice" = "1" ]; then
sudo apt install gimp
elif [ "$graphicschoice" = "2" ]; then
sudo apt install inkscape
elif [ "$graphicschoice" = "3" ]; then
wget https://launchpad.net/~inkscape-uploader/+snap/inkscape/+build/4308/+files/inkscape_0.91+devel_amd64.snap
sudo snap install inkscape_0.91+devel_amd64.snap
elif [ "$graphicschoice" = "4" ]; then
sudo apt install gimp inkscape
fi
sleep 1
clear
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
echo "-------------------------------"
echo "Installing some tools"
echo ""
echo "pastebinit, "
sudo apt install pastebinit
sleep 1
clear
echo "-------------------------------"
echo "Have a productive and happy day!"
echo "End of script"
echo "-------------------------------"
