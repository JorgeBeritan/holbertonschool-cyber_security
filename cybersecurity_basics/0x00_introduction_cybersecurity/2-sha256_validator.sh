#!/bin/bash
if [ "$(sha256sum -c <(echo "$2 $1"))" ] ; then echo "$1: OK"; fi
