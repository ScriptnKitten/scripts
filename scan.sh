#!/bin/bash
#finds only the current IP from inserted external network adapter and scans the network it is connected to with given level of nmap "loudness"

INTERF=$(ifconfig | grep wlp0 | cut -b 1-11)
case $INTERF in
	"wlp0s26u1u1")
		;;
	"wlp0s26u1u2")
		;;
	"wlp0s29u1u1")
		;;
	"wlp0s29u1u2")
		;;
	*)
		INTERF="no"
		;;
esac
if [ ! "$INTERF" = "no" ]; then
	echo "putting $INTERF into managed"
	sudo ifconfig $INTERF down
	sudo iwconfig $INTERF mode managed
	sudo ifconfig $INTERF up
else
	echo "Interface not found"
fi

ADDRSTR=$(ifconfig $INTERF 2>/dev/null | grep -v 'inet6' | grep -v '127.0.0.1' | awk '/inet/ {print $2}')
ADDR=(${ADDRSTR//./ })
ADDR[3]="0/24"
ADDRSTR=${ADDR[0]}.${ADDR[1]}.${ADDR[2]}.${ADDR[3]}
if [ ! "$ADDRSTR" = "...0/24" ]; then
	#nmap -T$1 $ADDRSTR
	echo "nmap -T$1 $ADDRSTR"
else
	echo "Not connected to network error"
fi
