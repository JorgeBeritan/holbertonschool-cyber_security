#!/bin/bash
path=$1
find $path -type f -size +1M ! -name "*.gz" 2> /dev/null