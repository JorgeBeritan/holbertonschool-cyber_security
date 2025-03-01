#!/bin/bash
nmap --script ssl-enum-ciphers -p 443 $1 | grep -E "weak|LOW|MEDIUM|NULL|RC4"