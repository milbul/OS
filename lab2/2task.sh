#!/bin/bash

ps -eo pid,command | grep -E '[[:space:]]/sbin/' | awk '{print $1}' > ans2
