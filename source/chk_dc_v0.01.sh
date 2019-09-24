#!/bin/bash
### termux use the path: /data/data/com.termux/files/usr/bin/bash

###################################################################################################################################
# Program: chk_dc means check domestic connection
# Version: 0.01
# Purpose: chk_dc is for simple check domestic connectivity 
# Author: Leonardo Setti
# Created Date: 19/07/2019
# Last modification: -- 
#
# --- GUIDE:
#
# Before run this, setup your IP Adresse for each device that will be checked.
# As default:
#	1. Modem Gateway
#	2. Repeater
#	3. Router
#
# TODO
# 1. Set as option input your devices IP Address when run this script in very first time
# 2. After #1 implementation, set an option to edit devices IP Addresses
# 3. Set an option to restart each device separatedly
#
# XXX
#
#
###################################################################################################################################
f_chk_repeater(){
	if ping -q -c 3 -W 1 192.168.25.100 >/dev/null; then
		CRPT_STAT=1
	else
		CRPT_STAT=0
fi
	echo $CRPT_STAT
}
f_chk_router(){
	if ping -q -c 3 -W 1 192.168.25.130 >/dev/null; then
		CROUTER_STAT=1
	else
		CROUTER_STAT=0
fi
echo $CROUTER_STAT

}

f_chk_modem(){
	if ping -q -c 3 -W 1 192.168.25.1 >/dev/null; then
		CMODEM_STAT=1
	else
		CMODEM_STAT=0
fi
echo $CMODEM_STAT
}

ROW=`printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' -`

clear

echo ""
$ROW
echo "Starting to check your connectivity... wait"
echo ""

printf '%*s\n' "${COLUMNS:-$(tput cols)}" '' | tr ' ' - 
ROUTER_STATUS=$(f_chk_router)
if [ $ROUTER_STATUS -eq 1  ]; then 
	echo "Router is up!"

	REPEATER_STATUS=$(f_chk_repeater)
	if [ $REPEATER_STATUS -eq 1  ]; then 
		echo "Repeater is up!"

		MODEM_STATUS=$(f_chk_modem)
		if [ $MODEM_STATUS -eq 1  ]; then 
			echo "Modem (Gateway) is up!"
		else
			echo "Modem (Gateway) is down or unreacheble"
			echo "Please restart your device and try again or check your network configuration."	
		fi

	else
		echo "Repeater is down or unreacheble"
		echo "Not able to check Modem (Gateway)"
		echo "Please restart your device and try again or check your network configuration."	
	fi

else
	echo "Router is down or unreacheble"

	echo "Not able to check Repeater and Modem (Gateway)"
	echo "Please restart your device and try again or check your network configuration."
fi

echo""

exit=0
