#!/bin/bash
sudo nmap -sA -p $2 -host-timeout 1000 -reason $1 