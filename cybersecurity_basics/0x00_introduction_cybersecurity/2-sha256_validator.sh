#!/bin/bash
if sha256sum -c <(echo "$2 $1") 2>/dev/null | grep -q ": OK$"; then echo "$1: OK"; fi