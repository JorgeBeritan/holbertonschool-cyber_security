#!/bin/bash
sudo nmap -sA -p $2 --max-rtt-timeout 1000ms -reason $1 