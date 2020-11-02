#!/bin/bash

ps -eo lstart,pid | awk 'NR>1' | sort -k1 | tail -1 | awk '{print $6}'
