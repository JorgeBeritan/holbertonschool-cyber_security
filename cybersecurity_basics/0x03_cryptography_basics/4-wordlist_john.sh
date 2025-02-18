#!/bin/bash
john $1 --wordlist=/usr/share/wordlists/rockyou.txt --format=Raw-MD5 > 4-password.txt