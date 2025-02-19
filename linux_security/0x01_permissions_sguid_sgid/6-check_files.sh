#!/bin/bash
find $1 -perm /4000 -perm /2000 -mtime -1 -type d -exec ls -l {}