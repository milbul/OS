#!/bin/bash

d=$(date +%F)
prevD=$(ls $HOME | grep "Backup" | sort | tail -1 | cut -d "-" -f2,3,4)

source="$HOME/source/"
if [[ -z "$prevD" || $(bc <<< "($(date -d $d +%s) - $(date -d $prevD +%s)) / 24 /3600") -ge 7 ]]; then
	backup="$HOME/Backup-$d"
	mkdir $backup
	copy=$(ls $source)
	for file in $copy; do
		cp $source/$file $backup/$file
	done
	echo "$backup was created, date: $d, copied: $copy" > $HOME/backup-report
else
	backup="$HOME/Backup-$prevD"
	copy=$(ls $source)
	echo "changes in $backup, date: $d" > temp
	for file in $copy; do
		if [[ -f $backup/$file ]]; then
			if [[ $(wc -c $backup/$file | awk '{print $1}') -ne $(wc -c $source/$file | awk '{print $1}') ]]; then
				mv $backup/$file $backup/$file"."$d
				cp $source/$file $backup/$file
				echo "old file $backup/$file now $backup$file"."$d" >> temp
			fi
		else
			cp $source/$file $backup/$file
			echo "new file $file" >> temp
			
		fi
	done
	[[ $(wc -l < temp) -gt 1 ]] && cat temp >> $HOME/backup-report
fi
