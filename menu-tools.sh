#!/bin/bash
# Bash Menu Script Example
PS3='Please enter your choice: ' "${options[@]}"
options=("IP-Scanner" "Disks-Usage" "WIFI-Scanner" "Quit")



select opt in "${options[@]}"
do
    case $opt in
        "IP-Scanner")
            rm ip-scan-$(date +"%Y-%m-%d").txt
	    echo "Type the range to ip scanner (XXX.XXX.XXX), followed by [ENTER]:"
            read scanip
            echo "scan for ip in range" $scanip".0-255/24"
            sudo nmap -sP $scanip".0/24" >> ip-scan-$(date +"%Y-%m-%d").txt
            echo "save to file ip-scan-$(date +"%Y-%m-%d").txt"
            ;;
        "Disks-Usage")
            sudo df -h
            ;;
        "WIFI-Scanner")
            sudo nmcli dev wifi > wifi-scan-$(date +"%Y-%m-%d").txt
            echo "save to file wifi-scan-$(date +"%Y-%m-%d").txt"
            ;;
        "Quit")
            break
            ;;
        *) echo "invalid option $REPLY";;
    esac
done
