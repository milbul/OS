#!/bin/bash

touch ans1
touch temp
ps U milenabulkina -o pid,command | awk 'NR>1' | awk '{print $1": " $2}' > temp
wc -l < temp > ans1
cat temp >> ans1

