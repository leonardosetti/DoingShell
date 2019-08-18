#! /bin/bash

###################################################################################################################################
# Progarm: upsys means update the system (automatically)!
# Version: 0.01
# Purpose: This is a simple tool get all updating tasks done automatically instead type each call to update your system 
# Author:  Leonardo Setti
# Created date: 27/11/2018
# Last modification:
# 
# --- GUIDE:
#
# As system user who wants get your system updated rapidly with a single command, just call upsys to run the commonly apt commands
#
# TODO
#
# 1. Make the output less noisy and more readable;
# 2. Add usefull and friendly messages for output;
# 3. Make a connection verification and go on with updates only if internet connection is available and download speed is higher than 4Mbps, 
#    otherwise terminate the process with a message telling the user is offline or have bad connection;
# 4. Provide a log of results when things goes bad;
# 5. Provide a generall log status;
# 6. Give to user a choice to flag the upsys as a recurrent service, maybe with crontab or equivalent
#
#
# XXX
#
#
###################################################################################################################################




clear
 
TIMENOW=`date`
SAGUD='sudo apt-get update'
SAGUG='sudo apt-get upgrade -y'
SAGDU='sudo apt-get dist-upgrade -y'
SAGAC='sudo apt-get autoclean'
SAGAR='sudo apt-get autoremove'

echo "--------------------------------------------------------------------------------------------------------------"

echo "______________________________________________________________________________________________________________"
echo "#  Current User: " $USER
echo "#  Time: " $TIMENOW
echo "______________________________________________________________________________________________________________"
echo '' 
echo '' 
echo "______________________________________________________________________________________________________________"
echo ">>>>>>>>>> Updating sources:"
echo "______________________________________________________________________________________________________________"
echo '' 
$SAGAR && $SAGUD 
echo '' 
echo "______________________________________________________________________________________________________________"
echo ">>>>>>>>>> Upgrading elegible softwares and distro if possible"
echo "______________________________________________________________________________________________________________"
echo ''
$SAGUG 
$SAGDU
echo '' 
echo "______________________________________________________________________________________________________________"
echo ">>>>>>>>>> Cleaning remaining pieces"
echo "______________________________________________________________________________________________________________"
echo ''
$SAGAR && $SAGAC
echo '' 
echo "##############################################################################################################"
echo "#  If you have no issues with your connection, all steps should have been completed successfully, good luck! #"
echo "#  Update process is DONE!                                                                                   #"
echo "##############################################################################################################"
echo ''
echo ''
exit 0


