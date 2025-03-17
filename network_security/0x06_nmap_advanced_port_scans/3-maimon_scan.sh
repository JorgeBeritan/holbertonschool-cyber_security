#!/bin/bash
sudo nmap -sM -p http,https,ftp,ssh,telnet -vvv $1