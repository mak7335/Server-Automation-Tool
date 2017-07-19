#!/bin/bash
tput bold
echo "Please wait while the server is installing and configuring.."
tput sgr0
yum install samba -y &> /dev/null
A()
{	echo ""
	echo "Create User For Samba Server"
	echo ""
	if [ $(id -u) -eq 0 ]; then
        	read -p "Enter username : " username
		read -s -p "Enter password : " passwd
        	egrep "^$username" /etc/passwd >/dev/null
        	if [ $? -eq 0 ]; then
        	        notify-send "$username exists!"
			zenity --error --title="Samba Server" --text="user exists";
        	        A
        	else
        	        useradd  $username
			echo -e "\nCreate Directory for Samba User\n"
			read -p "Directory name: " dir
			mkdir /$dir;
			chmod 777 /$dir;
			echo "" >> /etc/samba/smb.conf
			echo "[sharename]" >> /etc/samba/smb.conf
			echo "Path = /$dir" >> /etc/samba/smb.conf
			echo "Hosts allow = 192.168.0.0/24" >> /etc/samba/smb.conf
			echo "Valid users = $username" >> /etc/samba/smb.conf
			echo "Public = no" >> /etc/samba/smb.conf
			echo "Writable = no" >> /etc/samba/smb.conf
			echo "Adding $username to samba users"
  			echo -ne "$passwd\n$passwd\n" | smbpasswd -a -s $username
        	fi
	else

        notify-send "Only root may add a user to the system"
	zenity --error --title="User" --text="Permited by root only"
        A
fi
}
A
notify-send "Server is installed and configured sucessfully"
zenity --info --title="INSTALLATION" --text="Server is installed"
sh install.sh;
