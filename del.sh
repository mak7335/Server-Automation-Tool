#!/bin/bash
tput bold
echo "Please wait while the server is installing and configuring.."
tput sgr0
yum remove samba -y &> /dev/null
notify-send "Server is uninstalled/removed."
zenity --info --title="INSTALLATION" --text="uninstalled"
sh install.sh
