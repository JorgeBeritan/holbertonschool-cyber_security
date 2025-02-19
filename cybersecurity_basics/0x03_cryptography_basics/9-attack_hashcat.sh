#!/bin/bash
hashcat --stdout -a 1 wordlist1.txt wordlist2.txt | hashcat -m 0 -a 0 $1