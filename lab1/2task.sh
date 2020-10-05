#!/bin/bash

read input
ans=""
while [[ $input != "q" ]]
do
ans=$ans$input
read input
done
echo $ans
