#!/bin/bash

touch ans2
ps -eo pid,command | grep "/sbin/" | awk '{ print $1 }' > ans2
