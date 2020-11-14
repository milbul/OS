#!/bin/bash

[[ -d $HOME/restore ]] || mkdir $HOME/restore

backup=$(ls $HOME | grep "Backup" | sort | tail -1)
for file in $(ls $HOME/$backup); do
	[[ -z "$(echo $file | grep '\.[0-9]\{4,\}-[0-9]\{2,\}-[0-9]\{2,\}$')" ]] && cp $HOME/$backup/$file $HOME/restore/$file
done
