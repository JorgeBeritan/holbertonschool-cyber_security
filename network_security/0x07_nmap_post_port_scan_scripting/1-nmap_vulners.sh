#!/bin/bash
nmap --script "vuln" -p 80,443 $1