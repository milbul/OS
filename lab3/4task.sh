#!/bin/bash

./4cycle.sh &
pid1=$!
./4cycle.sh &
pid2=$!
./4cycle.sh &
pid3=$!
cpulimit --pid=$pid1 --limit=10 &
sleep 15
kill $pid3
