#!/bin/bash

   # Running updates
   zenity --password | sudo -Sk pacman -Syu

   # Installing Git
   zenity --password | sudo -Sk pacman -S --noconfirm git

   # Browser choice
   # -----------------
   browserchoice=$(zenity --list --width=500 --height=250 --window-icon=question --checklist \
	   --title="Browser Choices" --column="Pick" --column="Choices" \
	   FALSE Chrome FALSE Brave FALSE All TRUE None --separator=":")

   if [ "$browserchoice" = "Chrome" ]; then
      git clone https://aur.archlinux.org/google-chrome.git
      cd google-chrome
      zenity --password | yes | makepkg -srcif --noconfirm

   elif [ "$browserchoice" = "Brave" ]; then
      git clone https://aur.archlinux.org/brave-bin.git
      cd brave-bin
      zenity --password | yes | makepkg -srcif --noconfirm

   elif [ "$browserchoice" = "All" ]; then
      git clone https://aur.archlinux.org/google-chrome.git
      cd google-chrome
      yes |makepkg -srcif --noconfirm
      cd ../
      git clone https://aur.archlinux.org/brave-bin.git
      cd brave-bin
      yes | makepkg -srcif --noconfirm

   elif [ "$browserchoice" = "None" ]; then
      echo "No selection picked"

   fi

   # Graphics choice
   # -----------------
   graphicchoice=$(zenity --list --width=500 --height=250 --checklist \
       --title="Graphic Choices" --column="Pick" --column="Choices" \
      FALSE GIMP FALSE Inkscape FALSE All TRUE None --separator=":")

   if [ "$graphicchoice" = "GIMP" ]; then
      zenity --password | sudo -Sk pacman -S --noconfirm gimp

   elif [ "$graphicchoice" = "Inkscape" ]; then
      zenity --password | sudo -Sk pacman -S --noconfirm inkscape

   elif [ "$graphicchoice" = "All" ]; then
      zenity --password | sudo -Sk pacman -S --noconfirm gimp inkscape

   elif [ "$graphicchoice" = "None" ]; then
      echo "No selection picked"

   fi

   # Comms choice
   # -----------------
   commchoice=$(zenity --list --width=500 --height=250 --checklist \
      --title="Communication Choices" --column="Pick" --column="Choices" \
      FALSE Telegram FALSE Signal FALSE All TRUE None --separator=":")

   if [ "$commchoice" = "Telegram" ]; then
      zenity --password | sudo -Sk pacman -S --noconfirm telegram-desktop

   elif [ "$commchoice" = "Signal" ]; then
      zenity --password | flatpak install -y --user signal 

   elif [ "$commchoice" = "All" ]; then
      zenity --password | sudo -Sk pacman -S --noconfirm telegram-desktop && flatpak install -y --user signal 

   elif [ "$commchoice" = "None" ]; then
      echo "No selection picked"

   fi

   # Dev choices
   # -----------------
   devchoice=$(zenity --list --width=500 --height=250 --checklist \
      --title="Development Choices" --column="Pick" --column="Choices" \
      FALSE Kernel FALSE Terminal FALSE All TRUE None --separator=":")

   if [ "$devchoice" = "Kernel" ]; then
      zenity --password | sudo -Sk pacman -S --noconfirm linux-headers

   elif [ "$devchoice" = "Terminal" ]; then
      zenity --password | sudo -Sk pacman -S --noconfirm fish

   elif [ "$devchoice" = "All" ]; then
      zenity --password | sudo -Sk pacman -S --noconfirm linux-headers fish 

   elif [ "$devchoice" = "None" ]; then
      echo "No selection picked"

   fi