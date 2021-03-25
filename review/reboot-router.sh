#!/bin/sh

# simple command to restart both TP-Link devices on my network

# TODO: figure out how to pass the IP address, user_id and pssword when execute the script instead have it as harcoded info.

# restart the repeater:

echo 'Enter the device IP address to be rebooted: '
read ipaddress
echo 'Enter the priviledged user-id: ' 
read userid
echo 'Enter the correct password: '
read passwd

fpinger(){
    ping -c 3 -i 10  $ipaddress > /dev/null ; echo "$?"
    if [ $? = 0 ]
    then
        echo "Not able to restart device assigned as $ipaddress \nproccessed message: [$?]"
    else 
        echo "The targeted device $ipaddress is being restarted..."
        fi
    }

fsendsig(){
    curl --user $userid:$passwd --referer http://$ipaddress http://$ipaddress/userRpm/SysRebootRpm.htm?Reboot=Reboot > /dev/null
}

fspeed(){
    echo "If you wish verify your connection velocity type Y, otherwise type N: "
    read option

    if [ $option = "Y"  ]
    then
        speedtest
    else
        echo "Bye!"
        fi
    }

freboot(){
    ping -c 1 $ipaddress > /dev/null ; echo "$?"
    if [ $? = 0 ]
    then
        fsendsig
        fpinger
        echo "The process has been completed. \nIf you are not immediatally reconnected, wait for a moment and check if your device is responding"
    else
        echo "Verify your sent parameters, unable to proceed."
        fi
    }

echo "It might take some time, be patient the process has been started."

freboot
fspeed

exit=0
