#!/bin/bash
echo "-------------------------------"
echo "Welcome to your fresh "
awk 'FNR==2' /etc/os-release 
echo "-------------------------------"
echo ""
echo ""
echo "-------------------------------"
echo "Let's make sure your sources are up to date"
echo "running apt update"
echo "-------------------------------"
sleep 3
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
echo "-------------------------------"
echo "Install your browser of choice"
echo ""
echo "[1] Chrome WIP"
echo "[2] Chromuim"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read browserchoice
if [ "$browserchoice" = "2" ]; then
sudo -k apt install chromium-browser
fi
sleep 1
clear
echo "-------------------------------"
echo "Install your graphics software of choice"
echo ""
echo "[1] GIMP"
echo "[2] Inkscape"
echo "[3] Install all"
echo "-------------------------------"
echo ""
echo -n "Enter choice: "; read graphicschoice
if [ "$graphicschoice" = "1" ]; then
sudo apt install gimp
elif [ "$graphicschoice" = "2" ]; then
sudo apt install inkscape
elif [ "$graphicschoice" = "3" ]; then
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
clear
echo "-------------------------------"
echo "Have a productive and happy day!"
echo "End of script"
echo "-------------------------------"
