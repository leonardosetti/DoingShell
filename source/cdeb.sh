#! /bin/bash

# Simple script to allow ssh connection from termux to local debian host

# Check host availability 

f_chk_isp_stat(){
if wget -qO- 177.96.30.31|xargs echo  >/dev/null ; then 
	ISP_STAT=1
else
	ISP_STAT=0
fi
 echo -en "${ISP_STAT}\n"
}

#f_chk_isp_stat

ISP_CHK=$(f_chk_isp_stat)

if [ "$ISP_CHK" -eq 1 ]; then
#	ssh -p 22 leonardo@177.96.30.31
	ssh -l leonardosetti tty.sdf.org
else
	echo -en "Your host myght be offline or turned off\n"
fi
exit 0
kill $!
