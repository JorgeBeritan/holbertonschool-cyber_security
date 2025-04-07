#!/bin/bash
ATTACKER=$(grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' logs.txt | sort | uniq -c | sort -nr | head -1 | awk '{print $2}')
grep "$ATTACKER" logs.txt | grep -oE '"[^"]*User-Agent[^"]"' | sed 's/.*User-Agent: \([^"]*\).*/\1/' | sort | uniq -c | sort -nr | head -n 1 | awk '{$1=""; print substr($0x2)}'