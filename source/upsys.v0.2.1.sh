#! /bin/bash
###################################################################################################################################
# Progarm: upsys means update the system (automatically)!
# Version: 0.02
# Purpose: This is a simple tool get all updating tasks done automatically instead type each call to update your system 
# Author:  Leonardo Setti
# Created date: 27/11/2018
# Last modification: 14/07/2019
# 
# --- GUIDE:
#
# As system user who wants get your system updated rapidly with a single command, just call upsys to run the commonly sudo apt-get commands

# UPDATES:

# 1. connection verification is made before updates startsand. 

# TODO
#
# 1. Make the output less noisy and more readable;
# 2. Add usefull and friendly messages for output;
# 3. Make a verification download speed is higher than 4Mbps, 
#    otherwise terminate the process with a message telling the user have a bad connection;
# 4. Provide a log of results when things goes bad;
# 5. Provide a generall log status;
# 6. Give to user a choice to flag the upsys as a recurrent service, maybe with crontab or equivalent
#
#
# XXX
#
#
###################################################################################################################################
#Draw different types of lines in terminal screen

DRHL1=$(printf "%`tput cols`s"|sed "s/ /#/g")
DRHL2=$(printf "%`tput cols`s"|sed "s/ /-/g")
DRHL3=$(printf "%`tput cols`s"|sed "s/ /_/g")
DRHL4=$(printf "%`tput cols`s"|sed "s/ /*/g")
DRHL5=$(printf "%`tput cols`s"|sed "s/ /=/g")
DRHL6=$(printf "%`tput cols`s"|sed "s/ /+/g")
DRHL7=$(printf "%`tput cols`s"|sed "s/ />/g")
DRHL8=$(printf "%`tput cols`s"|sed "s/ /</g")

#Define Fereground Font Colors

FC1ON="\e[38;5;196m"
FC2ON="\e[38;5;202m"
FC3ON="\e[38;5;82m"
FC4ON="\e[38;5;142m"
FC5ON="\e[38;5;203m"
FC5ON="\e[38;5;202m"
FC6ON="\e[38;5;74m"
FCOFF="\e[0m"

#Set Font Attributes

SATT_BLD="\e[1m"
SATT_DIM="\e[2m"
SATT_BLK="\e[5m"
SATT_UDL="\e[4m"
SATT_REV="\e[7m"
SATT_PWD="\e[8m"

#Reset Font Attributes

RATT_BLD="\e[21m"
RATT_DIM="\e[22m"
RATT_BLK="\e[25m"
RATT_UDL="\e[24m"
RATT_REV="\e[27m"
RATT_PWD="\e[28m"

clear
f_today(){
	TODAY=$(date|awk '{print $2" " $3" " $4}')
	echo -en "$TODAY"
	}
	


f_timenow(){
	TIMENOW=$(date|awk '{print $5}')
	echo -en "$TIMENOW"
}


f_check_connection(){			
	if ping -q -c 1 -W 1 8.8.8.8 >/dev/null; then
	  C_STATUS=1
	else
	  C_STATUS=0
	fi
	echo -en "$C_STATUS"
	}

CONNECT_STATUS=$(f_check_connection)

if [ "$CONNECT_STATUS" -eq 1 ]; then 
echo -en "${SATT_BLK}${SATT_BLD}${FC3ON}You are online!${RATT_BLK}${RATT_BLD}${FCOFF}\n"
	echo -en ${FC3ON}$(printf ${DRHL5})

SAGUD='sudo apt-get update'
SAGUG='sudo apt-get upgrade -y'
SAGDU='sudo apt-get dist-upgrade -y'
SAGAC='sudo apt-get autoclean'
SAGAR='sudo apt-get autoremove'

echo -en "${FC2ON}Current User: ${SATT_BLD}${FC1ON}$(whoami)${FCOFF}\n"
echo -en "Today: $(f_today) Time now: $(f_timenow)\n"

echo -en  "${FC3ON}$(printf ${DRHL3})${FCOFF}\n"
echo -en ">>>>>>>>>> Updating sources:\n"
echo -en "${FC3ON}$(printf ${DRHL3})${FCOFF}\n"

	${SAGAR}  && ${SAGUD}|grep -i "upgraded"

echo -en "${FC6ON}$(printf ${DRHL3})${FCOFF}\n"
echo -en ">>>>>>>>>> Upgrading elegible softwares and distro if possible\n"
echo -en "${FC6ON}$(printf ${DRHL3})${FCOFF}\n"
	
	$SAGUG 
	$SAGDU

echo -en "${FC6ON}$(printf ${DRHL3})${FCOFF}\n"
echo -en ">>>>>>>>>> Cleaning remaining pieces\n"
echo -en "${FC6ON}$(printf ${DRHL3})${FCOFF}\n"

	$SAGAR && $SAGAC

echo -en "${FC6ON}$(printf ${DRHL1})\n"
echo -en "   If you have no issues with your connection, all steps should have been completed successfully, good luck!\n"
echo -en "   Update process is DONE!\n"
echo -en "$(printf ${DRHL1})${FCOFF}\n"
	
	else

		
		echo -en "${FC6ON}$(printf ${DRHL5})\n"
		echo -en "${FC6ON}You are${FCOFF} ${SATT_BLK}${SATT_BLD}${FC1ON}OFFLINE!${FCOFF} ${FC6ON}Please check your connection.${FCOFF}\n"
		echo -en "${FC6ON}$(printf ${DRHL5})\n"
fi

exit 0
kill $!
