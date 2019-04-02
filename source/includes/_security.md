# Authentication

```plaintext
Pick a language tab for a signature generation example.

1. Import a library for hashing and signing.
2. Get appropriate private key to use in signature.
3. Marshal request body to JSON, producing a "message."
	* If just testing signatures locally, you can use an example string.
4. Hash message with the Keccak-256 algorithm.
5. Sign the hash with the private key, producing a "signature."
6. Check and adjust results with further steps if needed.
	* Remove 0x prefix from signature hex string if present.
	* Check for an offset issue (last few characters will differ from expected results).
	* If there is an offset issue:
		- Do hex arithmetic to figure out the difference between expected and actual results.
		- When producing signatures, add the discovered offset.
		- Make sure corrected signature strings are 130 characters long.
```

```javascript
// JavaScript authentication example:

// For this example, we will use a library for message signing.
// See: https://github.com/pubkey/eth-crypto
const EthCrypto = require('eth-crypto');

// You will need a message (request body contents) and a private key.
// This private key will be an Ethereum private key, hex-encoded 
// and 64 characters in length, omitting any "0x" that might precede it.
var private_key = 'badba7368...c0202a97c';
var messageJSON = { test: 'message' };

// Stringify the message. (The string that gets hashed should be
// guaranteed to be the same as what is sent in the request.)
// NOTE: if testing the example strings, you can just declare them as
// strings, e.g. var message = 'Sila';
var message = JSON.stringify(messageJSON);

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
# Python authentication example:

# For this example, we will use a library for message signing.
# See: https://github.com/ethereum/eth-account
from eth_account import Account
import sha3
import json

# You will need a message (request body contents) and a private key.
# This private key will be an Ethereum private key, hex-encoded 
# and 64 characters in length, omitting any "0x" that might precede it.
key = 'badba7368...c0202a97c'
msg = {
	'test': 'message'
}

# Stringify the message. (The string that gets hashed should be
# guaranteed to be the same as what is sent in the request.)
# NOTE: if testing the example strings, you can just declare them as strings.
encoded_message = (json.dumps(msg)).encode("utf-8")

# Generate the message hash using the Keccak 256 algorithm.
k = sha3.keccak_256()
k.update(encoded_message)
message_hash = k.hexdigest()

# Sign the message_hash.
signed_message = Account.signHash(message_hash, key)
sig_hx = signed_message.signature.hex()
signature=str(sig_hx.replace("0x",""))

# Use encoded_message in the request body and sig_hx
# in the appropriate signature header.
print(signature)
print(encoded_message)

#...

# You can also sign messages with the Sila-Python SDK.

from silasdk import EthWallet

EthWallet.signMessage("my_message", "private_key")
```

```java
// No signing example here yet. Check back later!
```

```go
// Go authentication example:

package main

import (
	"encoding/hex"
	"encoding/json"
	"log"
	"math/big"

	// For this example, we will use a library for message signing.
	// See: https://github.com/ethereum/go-ethereum/crypto
	"github.com/ethereum/go-ethereum/crypto"
)

func main() {
	// You will need a message (the contents of the request body
	// you will send) and a private key.
	// This private key will be an ethereum private key. In this 
	// example, it should be a hex string 64 characters in length,
	// omitting any "0x" that might precede the number.
	privateKey := "badba7368...c0202a97c"
	messageJSON := map[string]interface{}{
		"test": "message",
	}

	// Convert a private key from hex to the *ecdsa.PrivateKey
	// type in your function if needed.
	pk, err := crypto.HexToECDSA(privateKey)
	if err != nil {
		log.Fatal(err)
	}

	// Marshal the message to JSON; this function returns bytes.
	// (The bytes that get hashed should be guaranteed to be the
	// same as what is sent in the request.)
	// NOTE: if testing the example strings, you can just declare them as
	// strings and cast them to bytes, e.g. message := []byte("Sila")
	message, err := json.Marshal(&messageJSON)
	if err != nil {
		log.Fatal(err)
	}

	// Generate the message hash using the Keccak 256 algorithm.
	msgHash := crypto.Keccak256(message)

	// Create a signature using your private key and hashed message.
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
	// cases, you might find that sigBytes now has a length of 64 or
	// less, so you can fix that in this way (this prepends the hex 
	// value with "0" until the requisite length is reached).
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
}
```

Where many other API systems may require client IDs and secrets, Sila uses the [Elliptic Curve Digital Signature Algorithm (ECDSA)](https://hackernoon.com/a-closer-look-at-ethereum-signatures-5784c14abecc) to secure and validate requests. Apps and users will have private keys, and Sila will only store addresses, which are directly derived from public keys. Since private keys cannot be derived from addresses or public keys, this can be considered a *zero knowledge proof*.

Here is a rough overview of the whole process:

1. A private/public ECDSA key pair is generated.
2. An "address" is derived from the public key.
3. The address is registered to a "handle" (like usernames in the Sila ecosystem) and stored by Sila.
4. A JSON request body is constructed and stringified. (This is the "message.")
5. A hash is generated from the message (using SHA3/Keccak-256).
6. The private key is used to sign the hash, which produces a signature.
7. A valid request to Sila can now be sent. The original "message" is sent in the POST request body, and a hex-encoded signature string is sent in a request header.
8. When a Sila endpoint receives the request, it will derive a public key from the message and the signature. An address is then derived from that public key.
9. If the derived address is registered under the handle that is specified in the request body, the request is validated.

### Implementing Digital Signatures

While digital signatures are generally considered highly secure and require zero knowledge of the original private key to verify ownership of the private key, here are a few hurdles you may encounter when implementing this authentication protocol.

**Expected Values:**

- Private keys should be **64** characters long as hex-encoded strings, not including any "0x" prefix. When signing with them, you may need to make sure the hex strings do *not* have a "0x" prefix, depending on your library.
- Addresses should be **42** characters long as hex-encoded strings, *including* a "0x" prefix. When sending them, add the prefix if your library doesn't add it automatically.
- Signatures should be **130** characters long as hex-encoded strings, not including any "0x" prefix. When sending them, you may need to ensure that they do *not* have a "0x" prefix.

**Known Pitfalls:**

- You'll (most likely) want to use a cryptographic library in whatever language(s) you use. Each library is different and may have its own quirks.
- Make sure you have marshalled your request body to JSON (bytes or string) *before* you create the signature. **Marshalling may or may not be a symmetric operation**; that is, the keys in the resulting JSON string may be ordered differently when the marshalling operation is conducted a second time. Problems may arise if you have a struct, hashmap, or JSONObject that you marshal when signing, then marshal again when sending the request. Any difference in the marshalled JSON request body will completely change its signature and result in failed validation.
- Some signing libraries may create a signature with a certain offset from what the Sila endpoint expects. For instance, signatures generated with a particular Go library are consistently off by 27. You will want to check your algorithm against some of our examples to make sure you don't have an offset issue.
- If you do have an offset issue, you will need to convert the hex string to a big integer, add the offset to it, and convert it back to a hex-encoded string.
- If you do have an offset issue and correct it, you may find that your new hex-encoded signature string may sometimes be less than 130 characters long. You can precede the string with 0s until it reaches the expected length to solve this issue.

### Sample Input/Outputs

These are some sample inputs and outputs using a sample private key. 

<aside class="warning">
<b>DO NOT USE THIS KEY FOR ANY REASON OTHER THAN TESTING SIGNATURES LOCALLY</b>.<br>Registering a user with this key means that <i>anyone</i> with access to this private key can authenticate requests on the user's behalf. Worse, using the associated address as a wallet to hold digital assets like Ethereum means that anyone with access to the private key <i>owns those assets</i>. <b>Beware!</b>
</aside>

**Private key**: 	`badba7368134dcd61c60f9b56979c09196d03f5891a20c1557b1afac0202a97c`<br>
**Address**: 		`0x65a796a4bD3AaF6370791BefFb1A86EAcfdBc3C1`

| Message String | Signature Hex String |
| :------------: | -------------------- |
| `Sila` | ea3706a8d2b4c627f847c0c6bfcd59f001021d790f06924ff395e9faecb510c53c09274b70cc1d29bde630d277096d570ee7983455344915d19085cc13288b421b |
| `test` | f9978f3af681d3de06b3bcf5acf2181b5ebf54e0110f1d9d773d691ca2b42bdc39bf478d9ea8287bd15369fa3fd25c09b8c3c02bdbafd19f2aad043e350a037c1b |
| `{"test":"message"}` | 835e9235dcdc03ed8928df5ace375bc70ea6f41699cd861b8801c9c617b4f2b658ff8e2cda47ea84401cab8019e5bb9daf3c0af2e7d2ab96cba6966a75e017171b |
| `{"test": "message"}` | 2de2f5d3f778e485f234956679373b9730b717c33e628651c3371e7eb31c4a27738af1a3bf85472a2a7dfc0628ddd21f8611ff0e170ebd24003c2a34b2760d5c1c |

If your signatures look almost the same except for the last few characters, you most likely have an offset issue. The good news is that your offset should be constant across your generated signatures. Some other libraries, such as the one we use in our Go example, also have this issue.

### Generating and Managing User Private Keys

```plaintext
Select a language tab to see an example of generating a private key.
```

```python
from silasdk import EthWallet

EthWallet.create("provide some entropy for randomness")
```

```javascript
wallet = sila.generateWallet()
```

```java
// Java private key generation example coming soon!
```

```go
// Go private key generation example coming soon!
```

It is critical for users' and apps' private keys to be kept secure. While we *are* able to freeze and restore users with new addresses in case of security crisis or fraud, this is by no means a desirable situation; too many private key hacks and your application could be at risk for having production access revoked or diminished.

Some applications may want to leave it to the user to keep private keys secure and sign requests as needed, but for many use cases, the private key layer may be better left concealed from users. In that case, applications will need to generate private keys for each of their users.

Use HD (hierarchical deterministic) wallets if you are managing users' private keys.