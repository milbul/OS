#!/bin/bash

echo $$ > .pid
ans=1
operation="+"
usr1()
{
	operation="+"
}
usr2()
{
	operation="*"
}
sigterm()
{
	exit
}
trap 'usr1' USR1
trap 'usr2' USR2
trap 'sigterm' SIGTERM
while true; do
	case $operation in
		"+")
			ans=$(($ans+2))
			;;
		'*')
			ans=$(($ans*2))
			;;
	esac
	echo $ans
	sleep 1
done
