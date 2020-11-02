#! /bin/bash

res_pid=0
res_mem=0
for pid in $(ps -eo pid | awk 'NR>1'); do
	if [[ -f /proc/$pid/statm ]]; then
		cur_mem=$(awk '{print $1}' /proc/$pid/statm)
		if [[ $cur_mem -gt $res_mem ]]; then
			res_mem=$cur_mem
			res_pid=$pid
		fi
	fi
done
echo 'pid = '$res_pid ' memory = ' $res_mem




