#!/bin/bash
ATTACKER=$(grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' logs.txt | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')

awk -v ip="$ATTACKER" '$1 == ip {print}' logs.txt | awk -F '""' 'NF > 5 {print $6}' | sort | uniq -c | sort -nr | head -n 1 | sed 's/^[ ]*[0-9]\+[ ]*//'