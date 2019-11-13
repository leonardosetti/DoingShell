 #! /bin/bash

#####
# TODO:
# 1. Create the functions to check you are on line and able to perform package sources download
# 2. Create fonctions to check time, date, user, environment (distro version etc) 
# 3. Create a friendly interface with color and lines or boxes
# 4. Make output noiseless
# 5. Create logs for updated or installed packs after script run
# 6. Create better comments

clear

f_time(){
	TIME_LOAD=$(date)
	echo -en $(TIME_LOAD)
}

f_time
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
