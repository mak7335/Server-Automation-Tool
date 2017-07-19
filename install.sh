#!/bin/bash
tput bold
echo -e "Web Server is on installing mode, wait a while.."
tput sgr0
yum install httpd httpd-devel -y  &> /dev/null
firewall-cmd --add-port=80/tcp &> /dev/null
firewall-cmd --add-service=http &> /dev/null
systemctl restart httpd &> /dev/null
echo -e "\nServerName 127.0.0.1" >> /etc/httpd/conf/httpd.conf;
systemctl restart httpd &> /dev/null
echo -e "<html>\nWELCOME TO YOUR APACHE WEB PAGE\n\nCONFIGURED BY SERVER AUTOMATION TOOL</html>" >> /var/www/html/index.html
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
			echo -e "\n0.CHANGE DEFAULT DIRECTORY(/var/www/html)\n1.VIRTUAL WEB HOSTING\n2.PORT REDIRECTION\n"
			read -p "Choose Your Option : " n
			case "$n" in 
				"0")	clear;
					tput bold
					echo -e "\n\n\t\t\tCHANGE DEFAULT DIRECTORY\n\n"
					read -p "Enter Directory Path : " dir
					sed -i 's/DocumentRoot "/var/www/html"/DocumentRoot "$dir"/g' /etc/httpd/httpd.conf;
					echo "Default Directory Changed to $dir"
					;;
				"1")	clear;
					tput bold
					echo -e "\n\n\t\t\tVIRTUAL WEB HOSTING\n\n"
					read -p "Enter the name of website you want to host : " web
					read -p "Enter the name of directory for your website : " dir
					mkdir /var/www/$dir
					touch /var/www/$dir/index.html
					echo -e "<html>\n\t<head>\n\t$web\n\t</head>\n\t<body>\n\tVirtual Web Hosting by SERVER AUTOMATION TOOL\n\t</body>\n<html>" >> /var/www/$dir/index.html
					echo -e "\n127.0.0.1	$web" >> /etc/hosts;
					echo -e "\n<virtualhost	*:80>\n\tDocumentroot	/var/www/$dir\n\tServername	$web\n</virtualhost>" >> /etc/httpd/http.conf;
					;;
				"3")	clear;
					tput bold
					echo "UNDER CONSTRUCTION"
					tput sgr0
					;;
			esac			
		elif [[ $input == "N" || $input == "n" ]]; then
			echo "YOU ENTERED NO"
		else
		        AC
		fi
}
AC
systemctl restart httpd &> /dev/null
notify-send "Server is installed and configured successfully."
zenity --info --title="INSTALLATION" --text="installed"
sh install.sh

