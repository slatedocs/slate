# Authentication

```javascript
// Authentication example:

// For this example, we will use a library for message signing.
// See: https://github.com/pubkey/eth-crypto
const EthCrypto = require('eth-crypto');

// You will need a message (request body contents) and a private key.
// This private key will be an Ethereum private key, hex-encoded 
// and 64 characters in length, omitting any "0x" that might precede it.
var messageJSON = { test: 'message' };
var private_key = 'PRIVATE_KEY';

// Stringify the message. (The string that gets hashed should be
// guaranteed to be the same as what is sent in the request.)
var message = JSON.stringify(messageJSON)

// Generate the message hash using the Keccak 256 algorithm.
var msg_hash = EthCrypto.hash.keccak256(message);

// Create a signature using your private key and the hashed message.
var signature = EthCrypto.sign(private_key, messageHash);

// The EthCrypto library adds a leading '0x' which should be removed 
// from the signature.
signature = signature.substring(2);

// The raw message should then be sent in an HTTP request body, and the signature
// should be sent in a header.
var request_data = {};
request_data.headers.signature = signature;
request_data.body = message;

//...
```

```python
# No signing example here yet. Check back later!
```

```java
// No signing example here yet. Check back later!
```

```go
// Authentication example:

// Imports used:
import (
	"encoding/hex"
	"encoding/json"
	"log"
	"math/big"

	"github.com/ethereum/go-ethereum/crypto"
)

// You will need a message (the contents of the request body
// you will send) and a private key.
// This private key will be an ethereum private key. In this 
// example, it should be a hex string 64 characters in length,
// omitting any "0x" that might precede the number.
privateKey := "PRIVATE_KEY"
messageJSON := map[string]interface{}{
  "test": "message",
}

// Convert a private key from hex to the *ecdsa.PrivateKey type 
// in your function if needed.
pk, err := crypto.HexToECDSA(privateKey)
if err != nil {
  log.Fatal(err)
}

// Marshal the message to JSON; this function returns bytes.
// (The bytes that get hashed should be guaranteed to be the
// same as what is sent in the request.)
message, err := json.Marshal(&messageJSON)
if err != nil {
  log.Fatal(err)
}

// Generate the message hash using the Keccak 256 algorithm.
msgHash := crypto.Keccak256(message)

// Create a signature using your private key and the hashed message.
sigBytes, err := crypto.Sign(msgHash, pk)
if err != nil {
  log.Fatal(err)
}

// The signature just created is off by -27 from what the API
// will expect. Correct that by converting the signature bytes 
// to a big int and adding 27.
var offset int64 = 27
var bigSig = new(big.Int).SetBytes(sigBytes)
sigBytes = bigSig.Add(bigSig, big.NewInt(offset)).Bytes()

// The big library takes out any padding, but the resultant 
// signature must be 130 characters (65 bytes) long. In some 
// cases, you might find that sigBytes now has a length of 64, so 
// you can fix that in this way (this prepends the hex value with 
// "0" until the requisite length is reached).
// Example: if two digits were required but the value was 1, you'd 
// pass in 01.
var sigBytesLength = 65 // length of a valid signature byte array
var arr = make([]byte, sigBytesLength)
copy(arr[(sigBytesLength-len(sigBytes)):], sigBytes)

// Encode the bytes to a hex string.
sig := hex.EncodeToString(arr)

// The raw message should then be sent in an HTTP request body, and
// the signature should be sent in a header.
log.Println("Message:", string(message))
log.Println("Signature:", sig, "Signature length:", len(sig))

//...
```

This API is secured by validating a signature of the request body (also simply referred to, in this documentation, as a "message").

Each created user and developer application must have a set of Ethereum keys. Whether managed by the developer or the user, the user's private key must be used to sign the request body of most messages, and the developer application keys must be used to sign every message.

<aside class="notice">In the code examples, replace `'PRIVATE_KEY'` with your private key.</aside>

## Zero Knowledge Proof

(TODO: Overview of how Ethereum signatures work to prove ownership of the private key without revealing the private key. Provide a link.)

## Managing Private Keys

- If generating and storing private keys on behalf of users, private keys should be stored in an encrypted form and never be sent over a network.
- If your developer keys or a user's keys are compromised, contact us immediately, and we can deactivate users/linked bank accounts, change addresses, and revert transactions as necessary.

(TODO: more details on recommended practices)

## Security

(TODO: Mention how replay attacks are prevented by enforcing a range on the created timestamp)
(2FA required for users and developers)
(Anything else?)
