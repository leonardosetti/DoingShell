#!/bin/bash
# progress bar function
prog() {
    local w=80 p=$1;  shift
    # create a string of spaces, then change them to dots
    printf -v dots "%*s" "$(( $p*$w/100 ))" ""; dots=${dots// /.};
    # print those dots on a fixed-width space plus the percentage etc. 
    printf "\r\e[K|%-*s| %3d %% %s" "$w" "$dots" "$p" "$*"; 
} 

	for x in {1..1} ; do       
	ping -q -c 3 -W 1 192.168.25.130 &>/dev/null
	prog "$x" still working...

	done ; echo                 

exit 0
kill $!
