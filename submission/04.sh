# Create a CLTV script with a timestamp of 1495584032 and public key below:

publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

locktime=1495584032


locktime_hex=$(printf '%08x' $locktime)

locktime_le=$(echo $locktime_hex | sed 's/../& /g' | awk '{for(i=NF;i>0;i--) printf $i}' )


pubkeyhash=$(echo -n "$publicKey" | xxd -r -p | openssl sha256 -binary | openssl ripemd160 -binary | xxd -p -c 256)


echo "04${locktime_le}b17576a914${pubkeyhash}88ac"

