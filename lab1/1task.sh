#!/bin/bash

let ans=$1
if [[ $2 -gt $ans ]]
then ans=$b
fi
if [[ $3 -gt $ans ]]
then ans=$3
fi
echo 'max is' $ans
