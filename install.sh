#!/bin/bash

tput bold
echo "Please wait a while, servers are being installed and configured..."
yum install -y mariadb mariadb-server &> /dev/null
systemctl start mariadb; 
systemctl enable mariadb;
tput sgr0
echo -e "\nPress ENTER(none) when asked for root password"
mysql_secure_installation;
firewall-cmd --permanent --add-service=mysql &> /dev/null
firewall-cmd --reload &> /dev/null
notify-send "Installed and Configured Successfully."
zenity --info --title="INSTALLATION" --text="installed"
sh install.sh
