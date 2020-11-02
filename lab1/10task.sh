#!/bin/bash

man bash | grep -o '[[:alpha:]]\{4,\}' | sort | uniq -c | sort -nr | head -n 3

