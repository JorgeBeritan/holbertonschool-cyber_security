#!/bin/bash
sudo nmap -sA -p $2 -host-timeout 1s -reason $1 