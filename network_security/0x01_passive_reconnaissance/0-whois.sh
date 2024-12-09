#!/bin/bash
whois $1 | grep -E '^(Registrant|Admin|Tech)' | sed 's/: /,/g' > $1.csv