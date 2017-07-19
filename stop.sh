#!/bin/bash
tput bold
echo "Please wait while we are removing the service.."
tput sgr0
systemctl stop mariadb 
notify-send "Server's service is stopped."
zenity --info --title="SERVICE" --text="stopped"
sh install.sh
~             
