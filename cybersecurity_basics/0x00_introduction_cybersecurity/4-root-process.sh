#!/bin/bash
ps aux | grep "$1" | grep -v "VSZ" | grep -v "RSS" | grep -v " 0 "