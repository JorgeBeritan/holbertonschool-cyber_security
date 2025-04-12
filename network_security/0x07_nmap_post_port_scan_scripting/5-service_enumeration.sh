#!/bin/bash
nmap -sV -O --traceroute -sC --script "banner,ssl-enum,smb-enum-domains" $1