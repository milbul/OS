#!/bin/bash

ans=1
operation="+"

(tail -f pipe) |
while true; do 
	read LINE;
	case $LINE in
		"QUIT")
			echo "exit"
			killall tail
			rm pipe
			exit
			;;
		"+")
			operation="+"
			;;
		'*')
			operation="*"
			;;
		[[:digit:]]*)
			if [[ $operation == "+" ]]; then
				ans=$(($ans+$LINE))
			else
				ans=$(($ans*$LINE))
			fi
			echo $ans
			;;
		*)
			echo "invalid token"
			rm pipe
			exit
			;;
	esac
done
