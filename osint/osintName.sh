#!/bin/bash
#OSINT via a name
#By: Jessica Ackerman @ScriptnKitten
#Last Update: 9/24/19
#format: osintName.sh <firstName> <lastName>

first=$1
last=$2

randomVal=$(( ( RANDOM % 10000000 ) + 1 ))

#TruePeopleSearch.com
s1="https://www.truepeoplesearch.com/results?name="$first" "$last

#peekyou.com
s2="https://peekyou.com/"$first"_"$last

#findPeopleSearch.com (WIP)
s3="https://www.findpeoplesearch.com/"
#"$first"+"$last"/18/1/"$randomVal

#411.com
s4="https://www.411.com/name/"$first"-"$last"?q="$first"+"$last

firefox -new-tab -url "$s1" -new-tab -url "$s2" -new-tab -url "$s3" -new-tab -url "$s4"


#_______________________________________________________________
#Sites in Progress:

