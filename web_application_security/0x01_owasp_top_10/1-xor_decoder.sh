#!/bin/bash
word=$1
resultado=""
if [[ "$word" =~ \{xor\} ]]; then
  clean_word="${word#\{xor\}}"

  bword=$(echo -n "$clean_word" | base64 -d | od -An -tx1 -v | tr -d ' \n')
  if [[ -n "$bword" ]]; then

    for ((i=0; i<${#bword}; i+=2)); do
      hex="${bword:i:2}"

      ascii=$((16#$hex))
      xor=$((ascii ^ 95))

      printf -v new_char "\\$(printf '%03o' "$xor")"
      resultado+="$new_char"
    done
    echo "$resultado"
  else
    echo "Error al decodificar la cadena en Base64."
  fi
else
  echo "La cadena no contiene la etiqueta {xor}."
fi