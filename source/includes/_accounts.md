Accounts
========

```javascript
/**
 * Create an account using the Augur.web.register method.
 */

var username = "tinybike";
var password = "tinypassword";

var account = Augur.web.register(username, password);
console.log("Account:", account);

// output
Account: {
    handle: 'tinybike',
    privateKey: <Buffer 55 ec ac 35 98 76 6f b9 05 de a2 13 8c 6d 48 7f 07 9e b1 36 a8 fb eb 5b 93 e2 59 6f 91 4f 35 81>,
    address: '0x09129dcde8e0f510ffb2a715709b69f5c4a42361',
    nonce: 0
}

/**
 * The user is automatically logged in after registering.  When logged in,
 * the user's data is kept in the the Augur.web.account object.  Logging out
 * unsets the Augur.web.account object.
 */

Augur.web.logout();
console.log("Account:", Augur.web.account);

// output
Account: {}

/* Logging in both sets and returns the Augur.web.account object: */

Augur.web.login("tinybike", "tinypassword");
console.log(Augur.web.account);

// output
{
    handle: 'tinybike',
    privateKey: <Buffer 55 ec ac 35 98 76 6f b9 05 de a2 13 8c 6d 48 7f 07 9e b1 36 a8 fb eb 5b 93 e2 59 6f 91 4f 35 81>,
    address: '0x09129dcde8e0f510ffb2a715709b69f5c4a42361',
    nonce: 0
}
```

augur.js includes a trustless account management system.  The purpose of the accounts system is to allow people to use Augur without needing to run an Ethereum node themselves, as running a full Ethereum node can be resource-intensive.  Accounts are trustless because only the user's encrypted key is stored on our server.  Transaction signing and serialization is entirely carried out in the browser using [ethereumjs-tx](https://github.com/ethereum/ethereumjs-tx) and the `eth_sendRawTransaction` RPC; the plaintext private key never touches our servers at any time.

First, the user specifies a username and password, and a private key (+ derived public key and address) is automatically generated for the user.  A secret key derived from the password using PBKDF2, along with a random 128-bit initialization vector, is used to encrypt the private key using AES-256.  The username, encrypted private key, and initialization vector are stored as a key-value pair in the Ethereum LevelDB.

<aside class="notice">This will be changed soon, possibly to nedb and/or html5 localstorage.  Manual put/get to the ethereum DB is [deprecated](https://github.com/ethereum/wiki/wiki/JSON-RPC) and slated for removal at some point.</aside>

Invoking contract methods is unchanged from normal use (from the client's perspective).  The Augur API functions can simply be called in the usual way (e.g., `Augur.reputationFaucet`), and augur.js will default to client-side transactions if the user is logged in.

The user's private key is encrypted using their password, then indexed by username and stored in our LevelDB.  We do not store the user's password (not even a hash of it) or their public key, and we do not have access to the user's account.  Since the user's account key is an ordinary Ethereum private key, the user's key (and therefore their funds and Reputation) can be used with any Ethereum node.  Therefore, although the accounts system is managed using an ordinary web server, since the user's funds are neither tied to nor controlled by our server, the accounts are still decentralized in the ways that (in our opinion) matter.
