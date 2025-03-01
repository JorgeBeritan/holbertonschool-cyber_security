#!/bin/bash
sudo iptables -F && sudo iptables -P INPUT DROP 
sudo iptables -A INPUT -p tcp --dport ssh -j ACCEPT -j DROP