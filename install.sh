#!/bin/bash
tput bold
echo "Please wait a while, Server is installing and configuring.."
yum install vsftpd -y &> /dev/null
systemctl restart vsftpd;
systemctl enable vsftpd;
firewall-cmd --add-port=21/tcp &> /dev/null
firewall-cmd --add-service=ftp &> /dev/null
sed -i 's/anonymous_login=YES/#anonymous_login=YES/g' /etc/vsftpd/vsftpd.conf;
sed -i 's/#local_enable/local_enable/g' /etc/vsftpd/vsftpd.conf;
sed -i 's/#anon_other_write_enable/anon_other_write_enable/g' /etc/vsftpd/vsftpd.conf;
chmod o+w /var/ftp/pub &> /dev/null
notify-send "Server is Installed and Configured Successfully"
zenity --info --title="INSTALLATION" --text="Complete";
tput sgr0
sh install.sh;
