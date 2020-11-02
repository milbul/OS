#!/bin/bash

prev=-1
sum=0
cnt=0

while read input; do
    cur=$(echo $input | awk '{print $7}')
    avg=$(echo $input | awk '{print $11}') 
    if [[ $cur -ne $prev ]]; then
        echo 'Average_Sleeping_Children_of_ParentID = ' $prev ' is ' $(echo "scale=6; $sum / $cnt" | bc)
        sum=$avg
        cnt=1
    else
    	prev=$cur
     	sum=$(echo "scale=6; $sum + $avg" | bc)
        ((cnt++))
    fi
    prev=$cur
    echo $input
done < ans4

echo 'Average_Sleeping_Children_of_ParentID = '$prev 'is' $(echo "scale=6; $sum / $cnt" | bc)
