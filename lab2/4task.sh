#!/bin/bash

touch temp

for pid in $(ps -eo pid | awk 'NR>1'); do
if [[ -f /proc/$pid/status ]]; then
	ppid=$(grep "PPid" /proc/$pid/status | awk '{print $2}')
	sum=$(grep "se.sum_exec_runtime" /proc/$pid/sched | awk '{print $3}')
	nr_switches=$(grep "nr_switches" /proc/$pid/sched | awk '{print $3}')
	art=$(echo "scale=6; $sum / $nr_switches" | bc)
	echo 'ProcessID = ' $pid ' : ' 'Parent_ProcessID = ' $ppid ' : ' 'Average_Running_Time = ' $art >> temp
fi	
done
cat temp | sort -nk5  > ans4
rm temp
