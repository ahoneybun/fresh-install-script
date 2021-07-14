 #!/bin/bash

   # Running updates
      zenity --password | sudo -Sk dnf update

   # Browser choice
   # -----------------
   browserchoice=$(zenity --list --width=500 --height=250 --window-icon=question --checklist \
	   --title="Browser Choices" --column="Pick" --column="Choices" \
	   FALSE Chrome FALSE Brave FALSE All TRUE None --separator=":")

   if [ "$browserchoice" = "Chrome" ]; then
      wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
      sudo rpm -i google-chrome-stable_current_x86_64.rpm

   elif [ "$browserchoice" = "Brave" ]; then
      zenity --password | sudo -Sk dnf install dnf-plugins-core
      sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
      sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
      zenity --password | sudo -Sk dnf install brave-browser

   elif [ "$browserchoice" = "All" ]; then
      wget https://dl.google.com/linux/direct/google-chrome-stable_current_x86_64.rpm
      sudo rpm -i google-chrome-stable_current_x86_64.rpm
      zenity --password | sudo -Sk dnf install dnf-plugins-core
      sudo dnf config-manager --add-repo https://brave-browser-rpm-release.s3.brave.com/x86_64/
      sudo rpm --import https://brave-browser-rpm-release.s3.brave.com/brave-core.asc
      zenity --password | sudo -Sk dnf install brave-browser

   elif [ "$browserchoice" = "None" ]; then
      echo "No selection picked"

   fi