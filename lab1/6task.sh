#!/bin/bash

grep "\[WARN\]"  /var/log/syslog.1 | sed 's/\[WARN\]/Warning:/g' > full.log
grep "<info>"  /var/log/syslog.1 | sed 's/<info>/Information:/g' >> full.log

