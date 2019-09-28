#!/bin/bash
#searches for a specific given terms from grep readable files in a given directory in a readable format
#intended for use finding policies based on terminology

term=$1

echo "1:"$term

echo "~~~~Searching for term: $term~~~~";
grep "$term" *;
echo " ";
echo "~~found in~~";
grep -l "$term" * | xargs echo;
echo " ";
echo " ";
