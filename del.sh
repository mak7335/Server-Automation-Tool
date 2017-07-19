#!/bin/bash
tput bold
echo "Please wait while the server is unistalling.."
tput sgr0
yum remove vsftpd -y &> /dev/null
notify-send "Server is uninstalled/removed."
zenity --info --title="INSTALLATION" --text="uninstalled"
sh install.sh
