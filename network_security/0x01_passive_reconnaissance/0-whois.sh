#!/bin/bash
whois $1 | grep -E '^(Registrant|Admin|Tech)' > $1.csv