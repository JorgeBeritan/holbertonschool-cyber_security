#!/bin/bash
sudo nmap -sW $1 -p $2 --exclude-ports $3