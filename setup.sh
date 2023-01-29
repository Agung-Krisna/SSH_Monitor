#!/bin/bash

# Reset
Color_Off='\033[0m'       # Text Reset

# Regular Colors
Red='\033[0;31m'          # Red
Green='\033[0;32m'        # Green


USAGE="
A script to help with configuring ssh monitor on your device. 
\n${Red}Must be run as root.${Color_Off}
\nTo use, supply ${Green}telegram bot id${Color_Off} as first argument and ${Green}telegram chat id${Color_Off} as second argument.
\nExample:
\n${Green}./setup.sh 123456789:abcdefghijklmnoprstuvwxyz 987654321
"

if [[ "$1" = "-h" ]]; then
    echo -e $USAGE
    exit
fi

if [[ $EUID -ne 0 ]]; then
    echo -e "${Red}The script must be run as root in order to configure ssh alert. Use -h to see help"
    echo -e "${Red}Exiting"
    exit
fi


if [ ! -n $1 ] || [ ! -n $2 ]; then 
    echo "Telegram bot id and chat id were not correctly set. Use -h to see help"
    exit
fi

echo -e "\nsend_text \"${1}\" \"${2}\"" >> ssh_monitor.sh

cp ssh_monitor.sh /etc/profile.d/