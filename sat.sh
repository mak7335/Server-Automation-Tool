#!/bin/bash
clear;
tput bold
echo -e "\t\t\tHELLO AND WELCOME TO SERVER AUTOMATION TOOL"
echo -e "\n\n\n0. NTP SERVER\n1. FILE SERVER\n2. NIS SERVER \n3. MAIL SERVER\n4  WEB SERVER \n5. DATABASE SERVER.\n6. KNOW THE STATUS OF ANY SERVER\n"
tput sgr0
read -p "Enter your choice : " num
echo ""
case "$num" in
	"0")	clear;
		tput bold
		echo -e "\nNTP SERVER BY SERVER AUTOMATION TOOL\n"
		tput sgr0
		echo -e "0. Installation & Configuration\n1. Service Start\n2. Service Stop\n3. Remove\Delete\n4. Starting step\n5. Know more about this Server\n"
		read -p "Enter your choice : " choice
                	case "$choice" in
                        	"0")    sh ntp/install.sh;
                                        ;;
                                "1")    sh ntp/start.sh;
                                        ;;
                                "2")    sh ntp/stop.sh;
                                        ;;
                                "3")    sh ntp/del.sh;
                                        ;;
                                "4")    sh install.sh;
                                        ;;
                                "5")    firefox html/ntp.html;
                                        ;;
                        esac
                        ;;
	"1")	clear;
		tput bold
		echo -e "\n FILE SERVER BY SERVER AUTOMATION TOOL\n"
		tput sgr0
		echo -e "0. FTP SERVER\n1. NFS SERVER\n2. SAMBA SERVER\n3. SSH SERVER\n4. Starting Step \n"
		read -p "ENTER YOUR CHOICE : " choice
		echo ""
		case "$choice" in
			"0")	clear;
				tput bold
				echo -e "\nFTP SERVER BY SERVER AUTOMATION TOOL\n"
				tput sgr0
				echo -e "0. Install & Configure\n1. Service Start\n2. Service Stop\n3. Remove\Delete\n4. Main Page\n5. Know more about this server"
				read -p "ENTER YOUR CHOICE : " choice
				echo ""
				case "$choice" in
					"0")	sh file/ftp/install.sh;
						;;
					"1")	sh file/ftp/start.sh;
						;;
					"2")	sh file/ftp/stop.sh;
						;;
					"3")	sh file/ftp/del.sh;
						;;
					"4")	sh install.sh;
						;;
					"5")	firefox html/ftp.html
						;;
				esac
				;;
			"1")    clear;
				tput bold
                                echo -e "\nNFS SERVER BY SERVER AUTOMATION TOOL\n\n"
				tput sgr0
                                echo -e "0. Install & Configure\n1. Service Start\n2. Service Stop\n3. Remove\Delete\n4. Starting Step\n5. Know more about this Server\n"
                                read -p "ENTER YOUR CHOICE : " choice
                                case "$choice" in
                                        "0")    sh file/nfs/install.sh;
                                                ;;
                                        "1")    sh file/nfs/start.sh;
                                                ;;
                                        "2")    sh file/nfs/stop.sh;
                                                ;;
                                        "3")    sh file/nfs/del.sh;
                                                ;;
                                        "4")    sh install.sh;
                                                ;;
                                        "5")    firefox html/nfs.html;
                                                ;;
                                esac
                                ;;
			"2")    clear;
				tput bold
                                echo -e "\nSAMBA SERVER BY SERVER AUTOMATION TOOL\n\n"
				tput sgr0
                                echo -e "0. Install & Configure\n1. Service Start\n2. Service Stop\n3. Remove\Delete\n4. Starting Step\n5. Know more about this Server\n"
                                read -p "ENTER YOUR CHOICE : " choice
				echo ""
                                case "$choice" in
                                        "0")    sh file/samba/install.sh;
                                                ;;
                                        "1")    sh file/samba/start.sh;
                                                ;;
                                        "2")    sh file/samba/stop.sh;
                                                ;;
                                        "3")    sh file/samba/del.sh;
                                                ;;
                                        "4")    sh install.sh;
                                                ;;
                                        "5")    firefox html/samba.html;
                                                ;;
                                esac
                                ;;
			"3")    clear;
				tput bold
                                echo -e "\nSSH SERVER BY SERVER AUTOMATION TOOL\n\n"
				tput sgr0
                                echo -e "0. Install & Configure\n1. Service Start\n2. Service Stop\n3. Remove\Delete\n4. Starting Step\n5. Know more about this Server\n"
                                read -p "ENTER YOUR CHOICE : " choice
				echo ""
                                case "$choice" in
                                        "0")    sh file/ssh/install.sh;
                                                ;;
                                        "1")    sh file/ssh/start.sh;
                                                ;;
                                        "2")    sh file/ssh/stop.sh;
                                                ;;
                                        "3")    sh file/ssh/del.sh;
                                                ;;
                                        "4")    sh install.sh;
                                                ;;
                                        "5")    firefox html/ssh.html;
                                                ;;
                                esac
                                ;;

			"4")	sh install.sh;
				;;
			"5")	firefox file.html;
				;;
		esac
		;;
	"2")    clear;
		tput bold
                echo -e "NIS SERVER BY SERVER AUTOMATION TOOL\n"
                tput sgr0
                echo -e "0. Installation & Configuration\n1. Service Start\n2. Service Stop\n3. Remove\Delete\n4. Starting step\n5. Know more about this Server\n"
                read -p "Enter your choice : " choice
		echo ""
                        case "$choice" in
                                "0")    sh nis/install.sh;
                                        ;;
                                "1")    sh nis/start.sh;
                                        ;;
                                "2")    sh nis/stop.sh;
                                        ;;
                                "3")    sh nis/del.sh;
                                        ;;
                                "4")    sh install.sh;
                                        ;;
                                "5")    firefox html/nis.html;
                                        ;;
                        esac
                        ;;
	"3")    clear;
		tput bold
                echo -e "\nMAIL SERVER BY SERVER AUTOMATION TOOL\n\n"
                tput sgr0
                echo -e "0. Installation & Configuration\n1. Service Start\n2. Service Stop\n3. Remove\Delete\n4. Starting step\n5. Know more about this Server\n"
                read -p "Enter your choice : " choice
                        case "$choice" in
                                "0")    sh mail/install.sh;
                                        ;;
                                "1")    sh mail/start.sh;
                                        ;;
                                "2")    sh mail/stop.sh;
                                        ;;
                                "3")    sh mail/del.sh;
                                        ;;
                                "4")    sh install.sh;
                                        ;;
                                "5")    firefox html/mail.html;
                                        ;;
                        esac
                        ;;
	"4")	clear;
		tput bold
                echo -e "\nWEB SERVER BY SERVER AUTOMATION TOOL\n\n"
                tput sgr0
                echo -e "0. Installation & Configuration\n1. Service Start\n2. Service Stop\n3. Remove\Delete\n4. Starting step\n5. Know more about this Server\n"
                read -p "Enter your choice : " choice
		echo ""
                        case "$choice" in
                                "0")    sh web/install.sh;
                                        ;;
                                "1")    sh web/start.sh;
                                        ;;
                                "2")    sh web/stop.sh;
                                        ;;
                                "3")    sh web/del.sh;
                                        ;;
                                "4")    sh install.sh;
                                        ;;
                                "5")    firefox html/web.html;
                                        ;;
                        esac
                        ;;
	"5")    clear;
		tput bold
                echo -e "\nDATABASE SERVER BY AUTOMATION SERVER TOOL\n\n"
                tput sgr0
                echo -e "0. Installation & Configuration\n1. Service Start\n2. Service Stop\n3. Remove\Delete\n4. Starting step\n5. Know more about this Server\n"
                read -p "Enter your choice : " choice
                        case "$choice" in
                                "0")    sh database/install.sh;
                                        ;;
                                "1")    sh database/start.sh;
                                        ;;
                                "2")    sh database/stop.sh;
                                        ;;
                                "3")    sh database/del.sh;
                                        ;;
                                "4")    sh install.sh;
                                        ;;
                                "5")    firefox html/database.html;
                                        ;;
                        esac
                        ;;
	"6")	clear;
		tput bold
		echo -e "\n SERVER AUTOMATION TOOL\n\n"
		tput sgr0
		echo -e "\n0. NTP SERVER\n1. FTP SERVER\n2. NFS SERVER\n3. SAMBA SERVER\n4. SSH SERVER\n5. DATABASE SERVER\n6. MAIL SERVER\n7. NIS SERVER\n8. WEB SERVER\n9. STARTING STEP\n"
		echo ""
		read -p "CHOOSE YOUR OPTION: " n
		echo ""
		case "$n" in
			"0")	systemctl status ntpd
				;;
			"1")	systemctl status vsftpd
				;;
			"2")	systemctl status nfs
				;;
			"3")	systemctl status smb
				;;
			"4")	systemctl status sshd
				;;
			"5")	systemctl status mariadb
				;;
			"6")	systemctl status postfix
				;;
			"7")	systemctl status ypserv
				;;
			"8")	systemctl status httpd
				;;
			"9")	sh install.sh
		esac
		sleep 3;
		sh install.sh
		;;
esac	
