#!/bin/bash
for pid in $(ps -eo pid | awk 'NR > 1'); do
if [[ -f /proc/$pid/io ]]; then
	old=$(sudo grep -w "write_bytes:" /proc/$pid/io | awk '{print $2}')
	echo $pid $old >> temp1
fi
done

sudo cat temp1
echo "Wait"
sleep 60

while read str; do
pid=$(echo $str | awk '{print $1}')
old=$(echo $str | awk '{print $2}')
if [[ -f /proc/$pid/io ]]; then
	new=$(sudo grep -w "write_bytes:" /proc/$pid/io |awk '{print $2}')
	res=$(bc <<< "$new - $old")
	echo $pid $res >> temp2
fi
done < temp1
sudo cat temp2
sudo sort -n -k2 temp2 | tail -n 3 | awk '{print $1}'
rm temp1
rm temp2	



