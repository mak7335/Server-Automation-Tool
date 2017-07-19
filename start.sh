#!/bin/bash
tput bold
echo "Please wait while we are starting the server.."
tput sgr0
systemctl start sshd
notify-send "Server's service is started."
zenity --info --title="SERVICE" --text="started"
sh install.sh
~             
