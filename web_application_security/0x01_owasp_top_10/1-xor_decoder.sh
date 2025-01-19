#!/bin/bash

word=$1
resultado=""

if [[ "$word" =~ \{xor\} ]]; then
  clean_word="${word#\{xor\}}"
  # Decodificar con Base64 y eliminar caracteres nulos
  bword=$(echo -n "$clean_word" | base64 -d 2>/dev/null | tr -d '\0')

  if [[ -n "$bword" ]]; then
    for (( i=0; i<${#bword}; i++)); do
      char="${bword:i:1}"
      ascii=$(printf "%d" "'$char'")
      xor=$((ascii ^ 95))
      # Eliminar caracteres nulos antes de la conversión a octal
      new_char=$(printf "%03o" "$xor" | tr -d '\0')
      new_char=$(printf "\\$new_char") 
      resultado+="$new_char"
    done
    echo "$resultado"
  else
    echo "Error al decodificar la cadena en Base64."
  fi
else
  echo "La cadena no contiene la etiqueta {xor}."
fi