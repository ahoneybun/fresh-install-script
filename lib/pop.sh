#!/bin/bash

# Running updates
zenity --password | sudo -Sk apt update; sudo apt upgrade

# Browser choice
# -----------------
browserchoice=$(zenity --list --width=500 --height=250 --window-icon=question --checklist \
	--title="Browser Choices" --column="Pick" --column="Choices" \
	FALSE Chrome FALSE Brave FALSE All TRUE None --separator=":")

if [ "$browserchoice" = "Chrome" ]; then
   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   sudo dpkg -i google-chrome-stable_current_amd64.deb
   sudo apt -f install

elif [ "$browserchoice" = "Brave" ]; then
   zenity --password | sudo -Sk apt install -y apt-transport-https curl gnupg
   curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
   echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list && sudo apt update -m
   zenity --password | sudo -Sk apt install -y brave-browser

elif [ "$browserchoice" = "All" ]; then
   wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
   sudo dpkg -i google-chrome-stable_current_amd64.deb
   sudo apt -f install
   zenity --password | sudo -Sk apt install -y apt-transport-https curl gnupg
   curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
   echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list && sudo apt update -m
   zenity --password | sudo -Sk apt install -y brave-browser

elif [ "$browserchoice" = "None" ]; then
   echo "No selection picked"

fi

   # Graphics choice
   # -----------------
   graphicchoice=$(zenity --list --width=500 --height=250 --checklist \
       --title="Graphic Choices" --column="Pick" --column="Choices" \
      FALSE GIMP FALSE Inkscape FALSE All TRUE None --separator=":")

   if [ "$graphicchoice" = "GIMP" ]; then
      zenity --password | sudo -Sk apt install -y gimp

   elif [ "$graphicchoice" = "Inkscape" ]; then
      zenity --password | sudo -Sk apt install -y inkscape

   elif [ "$graphicchoice" = "All" ]; then
      zenity --password | sudo -Sk apt install -y gimp inkscape

   elif [ "$graphicchoice" = "None" ]; then
      echo "No selection picked"

   fi

   # Comms choice
   # -----------------
   commchoice=$(zenity --list --width=500 --height=250 --checklist \
      --title="Communication Choices" --column="Pick" --column="Choices" \
      FALSE Telegram FALSE Signal FALSE All TRUE None --separator=":")

   if [ "$commchoice" = "Telegram" ]; then
      zenity --password | sudo -Sk apt install -y telegram-desktop

   elif [ "$commchoice" = "Signal" ]; then
      zenity --password | flatpak install -y --user signal 

   elif [ "$commchoice" = "All" ]; then
      zenity --password | sudo -Sk apt install -y telegram-desktop && flatpak install -y --user signal 

   elif [ "$commchoice" = "None" ]; then
      echo "No selection picked"

   fi

   # Dev choices
   # -----------------
   devchoice=$(zenity --list --width=500 --height=250 --checklist \
      --title="Development Choices" --column="Pick" --column="Choices" \
      FALSE Kernel FALSE Terminal FALSE All TRUE None --separator=":")

   if [ "$devchoice" = "Kernel" ]; then
      zenity --password | sudo -Sk apt install -y dwarves bison flex libssl-dev libelf-dev

   elif [ "$devchoice" = "Terminal" ]; then
      zenity --password | sudo -Sk apt install -y fish

   elif [ "$devchoice" = "All" ]; then
      zenity --password | sudo -Sk apt install -y fish libncurses5-dev dwarves bison flex libssl-dev libelf-dev

   elif [ "$devchoice" = "None" ]; then
      echo "No selection picked"

    fi