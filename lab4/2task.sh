#!/bin/bash

[ $# -eq 0 ] && echo "no args" && exit
file=/home/milenabulkina/lab4/"$1"
log="$(cat $HOME/.trash.log)"
> $HOME/.trash.log
for cur in $log ; do
	firstName="$( echo "$cur" | cut -d ":" -f 1 )"
	secondName="$( echo "$cur" | cut -d ":" -f 2 )"
	if [[ "$file" == "$firstName" ]]; then
		echo "make file $firstName alive again. y/n"
		read ans
		if [ $ans == "y" ]; then
			if [ -d "$(dirname "$firstName")" ]; then
				if ! [ -e "$(dirname "$firstName")/"$1"" ]; then
					ln "$HOME/.trash/$secondName" "$(dirname "$firstName")/"$1""
				else
					echo "you already have file like this, rename it"
					read new
					ln "$HOME/.trash/$secondName" "$(dirname "$firstName")/"$new""
				fi
			else
				echo "hmmm can't find $(dirname "$firstName")"
				ln "$HOME/.trash/"$1"" "$HOME/"$1""
			fi
			rm $HOME/.trash/$secondName
		fi
	else
		echo "$cur" >> $HOME/.trash.log
	fi
done

