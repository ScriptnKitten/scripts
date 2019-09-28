#!/bin/bash

#finds the current external wireless adapter, places it into monitor mode, and runs aircrack-ng
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
	echo "putting $INTERF into monitor mode"
	sudo ifconfig $INTERF down
	sudo iwconfig $INTERF mode monitor
	sudo ifconfig $INTERF up
	echo "running aircrack-ng suite"
	sudo airodump-ng $INTERF
else
	echo "Interface not found"
fi

