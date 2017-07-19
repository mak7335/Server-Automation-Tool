#!/bin/bash

tput bold
echo "Please wait a while, Server is installing and configuring.."

yum install nfs-utils -y &> /dev/null
echo "Create directory for NFS Server"
read -p "Create directory name for NFS SERVER" dir
mkdir /$dir
echo "" >> /etc/exports;
echo "/$dir		192.168.0.0/24(sync,rw)" >> /etc/exports;
tput sgr0
notify-send "Server is installed and configured successfully."
zenity --info --title="INSTALLATION" --text="Complete"
sh install.sh;

