#!/bin/bash
tail -n 1000 /var/log/auth.log | grep -E "Failed password|Accepted password" | awk '{print $(NF-5)}' | sort | uniq -c | sort -nr | head -n 1