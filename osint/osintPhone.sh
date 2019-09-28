#!/bin/bash
#OSINT via phone number
#By: Jessica Ackerman @ScriptnKitten
#format: osintNumber.sh <phoneNumber>
#note:phone number presented as just numbers and no additional characters

phone=$1

#411.com
s1="https://www.411.com/phone/"$phone

#TruePeopleSearch.com
s2="https://www.truepeoplesearch.com/results?phoneno="$phone

#peekyou.com
s3="https://www.peekyou.com/phone/"$phone

#whitepages.com
s4="https://www.whitepages.com/phone/"$phone

firefox -new-tab -url "$s1" -new-tab -url "$s2" -new-tab -url "$s3" -new-tab -url "$s4"

