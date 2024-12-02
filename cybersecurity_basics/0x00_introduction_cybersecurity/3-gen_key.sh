#!/bin/bash
ssh-keygen -t rsa -f "$1" -b 4096 -N "random"