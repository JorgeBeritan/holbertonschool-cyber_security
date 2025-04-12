#!/bin/bash
nmap -p 80,443 --script "http-vuln-cve2017-5638" $1
nmap -p 80,443 --script "ssl-enum-sciphers" $1
nmap -p 21, --script "ftp-anon" $1