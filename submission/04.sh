# Create a CLTV script with a timestamp of 1495584032 and public key below:
# publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277


# Locktime in decimal
locktime=1495584032

# Convert locktime to little-endian hex (4 bytes)
locktime_le=$(printf '%08x\n' $locktime | sed 's/../& /g' | awk '{print $4$3$2$1}')

publicKey="02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277"

# Derive pubKeyHash (RIPEMD160(SHA256(pubKey)))
pubKeyHash=$(echo -n $publicKey | xxd -r -p | openssl sha256 -binary | openssl ripemd160 | xxd -p -c 999)

# <4-byte locktime> OP_CHECKLOCKTIMEVERIFY OP_DROP OP_DUP OP_HASH160 <pubKeyHash> OP_EQUALVERIFY OP_CHECKSIG
scriptPubKey="04${locktime_le}b17576a914${pubKeyHash}88ac"

echo "ScriptPubKey (hex): $scriptPubKey"

#decoded=$(bitcoin-cli -regtest decodescript $scriptPubKey)

# Extract P2SH address
#p2sh_address=$(echo $decoded | jq -r '.p2sh')

#echo "P2SH address: $p2sh_address"

