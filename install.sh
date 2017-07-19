#!/bin/sh
tput bold
echo "Please wait a while, server is installing and being configured.."
tput sgr0
yum install openssh* -y &> /dev/null
systemctl restart sshd;
systemctl enable sshd;
firewall-cmd --add-port=22/tcp &> /dev/null
firewall-cmd --add-service=ssh &> /dev/null
A()
{
	echo -e "\nWant to Permit root user for Login? [Y,N]"
	echo ""
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
	        sed -i 's/#PermitRootLogin yes/PermitRootLogin yes/g' /etc/ssh/sshd_config;
	elif [[ $input == "N" || $input == "n" ]]; then
	        sed -i 's/#PermitRootLogin yes/PermitRootLogin no/g' /etc/ssh/sshd_config;
	else
		notify-send "Wrong Input"
		zenity --error --title="INPUT" --text="Wrong input"
		A
	fi
}
A
sed -i 's/#PermitEmptyPasswords no/PermitEmptyPasswords no/g' /etc/ssh/sshd_config;
sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config;
notify-send "Server is installed and confiigured sucessfully"
zenity --info --title="INSTALLATION" --text="Installed"
sh install.sh;
