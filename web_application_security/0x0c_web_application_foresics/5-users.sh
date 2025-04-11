#!/bin/bash
grep -oP '(?<=new user: name=)[^,]+' auth.log | sort -u | paste -sd'\t'