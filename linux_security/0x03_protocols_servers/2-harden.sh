#!/bin/bash
find /  -xdev -type d -perm -o+w -print -0002 -exec chmod o-w {} \