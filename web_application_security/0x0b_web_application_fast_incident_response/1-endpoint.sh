#!/bin/bash
awk 'NF>=7 {print $7}' logs.txt | sort | uniq -c | sort -nr | head -1 | awk '{print $2}'