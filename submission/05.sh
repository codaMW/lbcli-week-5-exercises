# Create a CSV script that would lock funds until one hundred and fifty blocks had passed
publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

blocks=150

blocks_hex=$(printf '%04x' $blocks)

csv_hex=$(echo $blocks_hex | sed 's/../& /g' | awk '{for(i=NF;i>0;i--) printf $i}')

pubkeyhash=$(echo -n "$publicKey" | xxd -r -p | openssl sha256 -binary | openssl ripemd160 -binary | xxd -p -c 256)

final_script="02${csv_hex}b27576a914${pubkeyhash}88ac"
echo "$final_script"

