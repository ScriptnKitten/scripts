#!/bin/bash

#finds the current IP from interface and panics if network matches PINEAP. 
#Changes to make:
    #implement into daemon
    #optimize usage
        #Can I check if a port on a specific IP is reachable with little CPU usage?
        
INTERF=$(ifconfig | grep wlp | cut -b 1-11)

if [ "$INTERF" = "wlp3s0: fla" ]; then
	INTERF="wlp3s0"
fi

case $INTERF in
        "wlp0s26u1u1")
                ;;
        "wlp0s26u1u2")
                ;;
        "wlp0s29u1u1")
                ;;
        "wlp0s29u1u2")
                ;;
        "wlp3s0")
                ;;
        *)
                INTERF="no"
                ;;
esac
if [ "$INTERF" = "no" ]; then
	echo "Interface not found"
else
	echo "Interface: "$INTERF
fi

#ADDRSTR="172.16.42.3"
ADDRSTR=$(ifconfig $INTERF 2>/dev/null | grep -v 'inet6' | grep -v '127.0.0.1' | awk '/inet/ {print $2}')
ADDR=(${ADDRSTR//./ })
ADDR[3]="1"
ADDRSTR=${ADDR[0]}.${ADDR[1]}.${ADDR[2]}.${ADDR[3]}
echo "Gateway: "$ADDRSTR

echo "potential pineapple"

#if the Pineapple webpage is found on the gateway:1471 then disable wifi
#if (( firefox --headless http://$ADDRSTR:1471/ )); then #doesn't work - need alternative
	echo "disabling NetworkManager"
	systemctl disable NetworkManager	
#fi
