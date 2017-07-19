#!/bin/bash
tput bold
echo "Please wait a while, server is installing and being configured.."
tput sgr0
yum install ypserv* ypbind*  nfs make* cach* portmap* xinetd* -y &> /dev/null
echo "NETWORKING=yes" >> /etc/sysconfig/network;
echo "NETWORKING_IPV6=no" >> /etc/sysconfig/network;
echo "HOSTNAME=server" >> /etc/sysconfig/network;
echo "NISDOMAIN=redhat" >> /etc/sysconfig/network;
echo ""
read -p "Enter the name of home directory for NIS SERVER: " homedir
echo ""
A()
{
	echo "Create User For NIS SERVER"
	if [ $(id -u) -eq 0 ]; then
		read -p "Enter username : " username 
		read -s -p "Enter password : " password
		egrep "^$username" /etc/passwd >/dev/null
		if [ $? -eq 0 ]; then
			notify-send "$username exists!"
			zenity --error --title="User" --text="user exists"
			A
		else
			mkdir /$homedir
			useradd -d /$homedir $username
			echo "$password" | passwd --stdin $username
			chmod 777 /$homedir
			echo "/$homedir/$username            *(rw,sync)" >> /etc/exports
		fi
	else
		notify-send "Only root may add a user to the system"
		zenity --error --title="Permission Denied" --text="only root user"
	fi
}
A
sed -i 's/all:  passwd group hosts rpc services netid protocols mail /all:  passwd group hosts rpc services netid /g' /var/yp/Makefile ;
cd /var/yp;
make &> /dev/null
systemctl restart ypserv;
notify-send "Server is installed and configured successfully."
zenity --info --title="INSTALLATION" --text="installed"
