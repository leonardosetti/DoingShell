#! /bin/bash

###################################################################################################################################
# Progarm: killth means Kill That!
# Version: 0.02
# Purpose: This is a simple tool to kill the given program as parameter
# Author:  Leonardo Setti
# Created date: 27/11/2018
# Last modification: 10/09/2019
# 
# Change Log:
#
# 1. The to do section has been modified, and updated;
# 2. For has been implemented, thus a list of all PID related to a program is displayed and processes terminated;
# 3. A new necessity has been logged in to do section - item 3;
# 4. New phrases are displayed when user types the wanted program to kill, just a friendly description
# 5. Change log section added
#
# --- GUIDE:
#
# As system user who wants terminate a program using kill command, just type the right program name and stroke Enter key
# the script will read the PID related to given program then kill using PID parameter
# if any program be found the program will terminate without kills
#
# TODO
# 
# New approach rises in my mind:
#	1. Set the kill optional after send the parameter (wanted program to kill)
#	2. Make chosable if user wants to kill only a PID or the PGID
#       3. Give to user a choice to giveup the assasination of process(es)
#
#
# XXX
# N/A
#
###################################################################################################################################

clear

echo -en Enter the program name wanted to kill:\n
read TARGET

killer(){
for pid  in ${CATCHPID}; 
	do kill $pid; 
	done
}

CATCH_HEAD=$(ps -eo ppid,pgid,pid,time,ouid,ruser,pcpu,start,comm|grep -i pid)
CATCHPID=$(ps -eo pid,comm|grep "${TARGET}"|awk '{print $1}')
CATCHPPID=$(ps -eo ppid,comm|grep "${TARGET}"|awk '{print $1}')
CATCHPGID=$(ps -eo pgid,comm|grep "${TARGET}"|awk '{print $1;exit}')
WHOLESTAT=$(ps -eo ppid,pgid,pid,time,ouid,ruser,pcpu,start,comm|grep "${TARGET}") 
CAPTURED_TGT=$(ps -eo pid,comm|grep "${TARGET}"|awk '{print $2;exit}')
PID_LINE=$(pidof ${CAPTURED_TGT})
	
	if [ -z "${CATCHPID}" ]
		then 	
			FLAG=1
			echo "There is no process related to: "$TARGET"\n"
			echo -en
		else
		        echo -en "$CATCH_HEAD"\n
			echo -en "$WHOLESTAT"\n		
			echo -en
			echo -en Targeted process refers to "$CAPTURED_TGT"  PID\(s\): "$PID_LINE" and Process Group: "$CATCHPGID"\n
			FLAG=0
	fi

	if [ $FLAG = 0 ] 
		then 
		set -- $(locale LC_MESSAGES)
		yesptrn="$1"; noptrn="$2"; yesword="$3"; noword="$4"
		while true; do
    				read -p "Do you want to kill "$CAPTURED_TGT" - "$PID_LINE" (${yesword} / ${noword})? " yn
    			case $yn in
        			${yesptrn##^} ) echo Killing "$CAPTURED_TGT" process PID: "$PID_LINE"\n;killer;;
        			${noptrn##^} )	echo The process "$PID_LINE" has not been killed and still running.\n; exit;;
        			* ) echo "Please answer ${yesword} / ${noword}.";;
    			esac
		done
			echo -en The process "$PID_LINE" has been killed successfully!\n
		else
			echo -en "The killing process related to " "$TARGET" "has failed or requested PID doesn\'t exists\n" 
	fi
		echo -en "Bye!\n"
	exit 0
kill $!
