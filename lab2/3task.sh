#!/bin/bash

ps -eo start,pid,cmd > temp
cat temp | awk 'NR>1' | tail -3 | head -1 |  awk '{print $2}'
rm temp
