#!/bin/bash

word=$1
resultado=""

if [[ "$word" =~ \{xor\} ]]; then
  clean_word="${word#\{xor\}}"
  bword=$(echo -n "$clean_word" | base64 -d )
  
  for (( i=0; i<${#bword}; i++)); do
    char="${bword:i:1}"
    ascii=$(printf "%d" "'$char'")
    xor=$((ascii ^ 95))
    new_char=$(printf "\\$(printf '%03o' "$xor")")
    resultado+="$new_char"
  done
  echo "$resultado"
fi
