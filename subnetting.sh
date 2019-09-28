#!/bin/bash

#WIP
#syntax: ./subnetting.sh subnet newIP

#get inputs
String1=$1
String2=$2

#split out octets
ADDR2=(${String1//./ })
ADDR1=(${String2//./ })

#subtract addresses
SUB0=$(expr ${ADDR1[0]} - ${ADDR2[0]})
SUB1=$(expr ${ADDR1[1]} - ${ADDR2[1]})
SUB2=$(expr ${ADDR1[2]} - ${ADDR2[2]})
SUB3=$(expr ${ADDR1[3]} - ${ADDR2[3]})

#calculate subnetting basic
if [ $SUB3 -eq 0 ]; then
	echo cat>/dev/null
else
	VAL=24
fi
if [ $SUB2 -eq 0 ]; then
	echo cat>/dev/null
else
	VAL=16
fi
if [ $SUB1 -eq 0 ]; then
	echo cat>/dev/null
else
	VAL=8
fi
if [ $SUB0 -eq 0 ]; then
	echo cat>/dev/null
else
	VAL=0
fi

#echo $VAL

#calculate subnetting advanced
if [ $VAL -eq 24 ]; then
	VAL=$(expr $VAL + 8)
	if [ $SUB3 -ge 128 ]; then
		VAL=$(expr $VAL - 1)
		SUB3=$(expr $SUB3 - 128)
	fi
	if [ $SUB3 -ge 64 ]; then
		VAL=$(expr $VAL - 1)
		SUB3=$(expr $SUB3 - 64)
	fi
	if [ $SUB3 -ge 32 ]; then
		VAL=$(expr $VAL - 1)
		SUB3=$(expr $SUB3 - 32)
	fi
	if [ $SUB3 -ge 16 ]; then
		VAL=$(expr $VAL - 1)
		SUB3=$(expr $SUB3 - 16)
	fi
	if [ $SUB3 -ge 8 ]; then
		VAL=$(expr $VAL - 1)
		SUB3=$(expr $SUB3 - 8)
	fi
	if [ $SUB3 -ge 4 ]; then
		VAL=$(expr $VAL - 1)
		SUB3=$(expr $SUB3 - 4)
	fi
	if [ $SUB3 -ge 2 ]; then
		VAL=$(expr $VAL - 1)
		SUB3=$(expr $SUB3 - 2)
	fi
	if [ $SUB3 -ge 1 ]; then
		VAL=$(expr $VAL - 1)
	fi
fi
if [ $VAL -eq 16 ]; then
	VAL=$(expr $VAL + 7)
	if [ $SUB2 -ge 128 ]; then
		VAL=$(expr $VAL - 1)
		SUB2=$(expr $SUB2 - 128)
	fi
	if [ $SUB2 -ge 64 ]; then
		VAL=$(expr $VAL - 1)
		SUB2=$(expr $SUB2 - 64)
	fi
	if [ $SUB2 -ge 32 ]; then
		VAL=$(expr $VAL - 1)
		SUB2=$(expr $SUB2 - 32)
	fi
	if [ $SUB2 -ge 16 ]; then
		VAL=$(expr $VAL - 1)
		SUB2=$(expr $SUB2 - 16)
	fi
	if [ $SUB2 -ge 8 ]; then
		VAL=$(expr $VAL - 1)
		SUB2=$(expr $SUB2 - 8)
	fi
	if [ $SUB2 -ge 4 ]; then
		VAL=$(expr $VAL - 1)
		SUB2=$(expr $SUB2 - 4)
	fi
	if [ $SUB2 -ge 2 ]; then
		VAL=$(expr $VAL - 1)
		SUB2=$(expr $SUB2 - 2)
	fi
	if [ $SUB2 -ge 1 ]; then
		VAL=$(expr $VAL - 1)
	fi
fi
if [ $VAL -eq 8 ]; then
	echo "sub1 = "$SUB1
	VAL=$(expr $VAL + 8)
	if [ $SUB1 -ge 128 ]; then
		VAL=$(expr $VAL - 1)
		SUB1=$(expr $SUB1 - 128)
	fi
	if [ $SUB1 -ge 64 ]; then
		VAL=$(expr $VAL - 1)
		SUB1=$(expr $SUB1 - 64)
	fi
	if [ $SUB1 -ge 32 ]; then
		VAL=$(expr $VAL - 1)
		SUB1=$(expr $SUB1 - 32)
	fi
	if [ $SUB1 -ge 16 ]; then
		VAL=$(expr $VAL - 1)
		SUB1=$(expr $SUB1 - 16)
	fi
	if [ $SUB1 -ge 8 ]; then
		VAL=$(expr $VAL - 1)
		SUB1=$(expr $SUB1 - 8)
	fi
	if [ $SUB1 -ge 4 ]; then
		VAL=$(expr $VAL - 1)
		SUB1=$(expr $SUB1 - 4)
	fi
	if [ $SUB1 -ge 2 ]; then
		VAL=$(expr $VAL - 1)
		SUB1=$(expr $SUB1 - 2)
	fi
	if [ $SUB1 -ge 1 ]; then
		VAL=$(expr $VAL - 1)
	fi
fi
if [ $VAL -eq 0 ]; then
	VAL=$(expr $VAL + 7)
	if [ $SUB0 -ge 128 ]; then
		VAL=$(expr $VAL - 1)
		SUB0=$(expr $SUB0 - 128)
	fi
	if [ $SUB0 -ge 64 ]; then
		VAL=$(expr $VAL - 1)
		SUB0=$(expr $SUB0 - 64)
	fi
	if [ $SUB0 -ge 32 ]; then
		VAL=$(expr $VAL - 1)
		SUB0=$(expr $SUB0 - 32)
	fi
	if [ $SUB0 -ge 16 ]; then
		VAL=$(expr $VAL - 1)
		SUB0=$(expr $SUB0 - 16)
	fi
	if [ $SUB0 -ge 8 ]; then
		VAL=$(expr $VAL - 1)
		SUB0=$(expr $SUB0 - 8)
	fi
	if [ $SUB0 -ge 4 ]; then
		VAL=$(expr $VAL - 1)
		SUB0=$(expr $SUB0 - 4)
	fi
	if [ $SUB0 -ge 2 ]; then
		VAL=$(expr $VAL - 1)
		SUB0=$(expr $SUB0 - 2)
	fi
	if [ $SUB0 -ge 1 ]; then
		VAL=$(expr $VAL - 1)
	fi
fi

echo $VAL
