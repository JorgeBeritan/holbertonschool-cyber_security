#!/bin/bash
if [ "$(sha256sum "$1" | cut -d' ' -f1)" = "$2" ] ; then echo "$1: OK"; fi
