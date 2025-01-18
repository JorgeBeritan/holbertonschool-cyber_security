#!/bin/bash
HASH="$1"
KEY="242b2c2d"  # Cambiar según la clave XOR usada por WebSphere

# Decodificar el hash usando XOR
decode_xor() {
  local encoded=$1
  local key=$2
  local decoded=""

  # Convertir los datos codificados y la clave en arrays de bytes
  for ((i = 0; i < ${#encoded}; i += 2)); do
    byte=${encoded:i:2}
    key_byte=${key:$((i % ${#key})):2}
    xor_byte=$(printf "%x" "$((0x$byte ^ 0x$key_byte))")
    decoded+=$(printf "\\x$xor_byte")
  done

  echo -e "$decoded"
}

RESULT=$(decode_xor "$HASH" "$KEY")
echo "Resultado decodificado: $RESULT"
