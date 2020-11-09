#!/bin/bash

cnt=$(cat cur_cnt | awk '{print $1}')
((cnt++))
file="$1"

[ $# -eq 0 ] && echo "no args" && exit
[ -f "$file" ] || { echo "file doesnt exist"; exit; }
[ -d $HOME/.trash ] || mkdir $HOME/.trash

ln "$file" "$HOME/.trash/$cnt"
rm "$file"

[ -d $HOME/.trash.log ] || touch $HOME/.trash.log

echo "$PWD/"$file":$cnt" >> $HOME/.trash.log

echo $cnt > cur_cnt
