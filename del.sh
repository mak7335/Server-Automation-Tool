#!/bin/bash
tput bold
echo "Please wait while the server is uninstalling.."
tput sgr0
yum remove ypserv ypbind -y &> /dev/null
notify-send "Server is uninstalled/removed."
zenity --info --title="INSTALLATION" --text="uninstalled"
sh install.sh
