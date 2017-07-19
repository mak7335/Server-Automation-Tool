#!/bin/bash
tput bold
echo "Please wait a while, server's installtion and configuration is taking time"
tput sgr0
yum install ntp -y &> /dev/null
firewall-cmd --permanent --add-port=123/tcp &> /dev/null
firewall-cmd --reload &> /dev/null
firewall-cmd --permanent --add-service=ntp &> /dev/null
firewall-cmd --reload &> /dev/null
systemctl enable ntpd.service;
systemctl start ntpd.service;
sed -i '/restrict default nomodify notrap nopeer noquery/a \hrestrict -6 default kod nomodify notrap noquery nopeer   --->> allows forces DNS' /etc/ntp.conf
sed -i '/hrestrict -6 default kod nomodify notrap noquery nopeer   --->> allows forces DNS/a \resolution to IPV6 address resolution/'
AC()
{
	clear;
	echo ""
	echo "ADVANCED CONFIGURATION? [Y,N]"
	echo ""
	read input
	if [[ $input == "Y" || $input == "y" ]]; then
		tput bold
		echo -e "\n\n\t\t\tADVANCED CONFIGURATION\n."
		tput sgr0
		echo -e "\n0. Allow Only Specific Clients\n1. Add Local Time As Backup\n2. Create A Log File"
		read -p "Choose Your Option : " n
		case "$n" in 
			"0")	clear;
				tput bold
				echo -e "\n\n\t\t\tAllow Only Specific Clients\n\n"
				echo -e "\nrestrict 192.168.1.0 netmask 255.255.255.0 nomodify notrap\n" >> /etc/ntp.conf
				echo -e "\n Allowed Clients: 192.168.1.0/24"
				tput sgr0
				;;
			"1")	clear;
				tput bold
				echo -e "\n\n\t\t\tCreating Local Backup\n\n"
				read -p "Specify Your Ip Address: " ip
				echo -e "\nserver	$ip	#local clock\nfudge	127.127.1.0 stratum 10\n" >> /etc/ntp.conf;
				;;
			"3")	clear;
				tput bold
				logfile /var/log/ntp.log;
				echo -e "/n/nLog File Created: /var/log/ntp.log"
				tput sgr0
				;;
		esac			
	elif [[ $input == "N" || $input == "n" ]]; then
		notify-send "You Entered NO"
		zenity --info --title="INPUT" --text="NO"
	else
	        AC
	fi
}
AC
systemctl restart ntpd;
notify-send "Server is installed and configured successfully."
zenity --info --title="INSTALLATION" --text="installed"
sh install.sh
