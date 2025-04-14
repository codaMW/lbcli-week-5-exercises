# Create a CLTV script with a timestamp of 1495584032 and public key below:

publicKey=02e3af28965693b9ce1228f9d468149b831d6a0540b25e8a9900f71372c11fb277

locktime=1495584032

locktimeHex=$(printf '%x' $locktime)

cltvScript="${locktimeHex} OP_CHECKLOCKTIMEVERIFY OP_DROP ${publicKey} OP_CHECKSIG"

echo $cltvScript


