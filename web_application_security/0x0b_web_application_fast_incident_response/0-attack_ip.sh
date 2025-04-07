#!/bin/bash
grep -oE '([0-9]{1,3}\.){3}[0-9]{1,3}' logs.txt | sort | uniq -c | sort -nr | head -1