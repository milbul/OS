#!/bin/bash

grep -o -h "[[:alnum:]\+\-\._]\+@[[:alnum:]\+\-\._]\+\.[[:alpha:]]\+" /etc/* |
tr -s '\n' ', ' > emails.lst
