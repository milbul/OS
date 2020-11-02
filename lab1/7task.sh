#!/bin/bash

grep -o -h -s "[[:alnum:]\+\-\._]\+@[[:alnum:]\+\-\._]\+\.[[:alpha:]]\+" /etc/* | awk '{print $1}' | tr -s '\n' ', ' > emails.lst

