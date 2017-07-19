#!/bin/bash

tput bold
echo -e "Please wait a while, server is being installing and configuring.."
yum install postfix &> /dev/null`
read -p "Specify Your Hostname (eg. gmail or yahoo) : " hn
read -p "Specify Your Domain-name (eg. com, yahoo, in) : " dn
sed -i "s/#myhostname = host.domain.tld/myhostname = $hn/g" /etc/postfix/main.cf
sed -i "s/#mydomain = domain.tld/mydomain = $dn/g" /etc/postfix/main.cf
sed -i 's/#myorigin = $mydomain/myorigin = $mydomain/g' /etc/postfix/main.cf
sed -i 's/mydestination = $myhostname, localhost.$mydomain, localhost/mydestination = $myhostname, localhost.$mydomain, localhost, $mydomain/g' /etc/postfix/main.cf
sed -i 's|#mynetworks = 168.100.189.0/28, 127.0.0.0/8|mynetworks = 168.100.189.0/28, 127.0.0.0/8|g' /etc/postfix/main.cf
sed -i 's|#home_mailbox = Mailbox|home_mailbox = Maildir/|g' /etc/postfix/main.cf
sed -i 's|#header_checks = regexp:/etc/postfix/header_checks|header_checks = regexp:/etc/postfix/header_checks|g' /etc/postfix/main.cf
sed -i 's/#smtpd_banner = $myhostname ESMTP $mail_name/smtpd_banner = $myhostname ESMTP/g' /etc/postfix/main.cf
systemctl restart postfix;
notify-send "Server is installed and configured."
zenity --info --title="INSTALLATION" --text="installed"
tput sgr0
sh install.sh;

