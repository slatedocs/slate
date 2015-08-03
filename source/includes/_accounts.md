Accounts
========

```javascript
/**
 * Create an account using the augur.web.register method.
 */

var username = "tinybike";
var password = "tinypassword";

augur.web.register(username, password, function (account) {
    console.log("Account:", account); 
});

// output
Account: {
    handle: 'tinybike',
    privateKey: <Buffer 55 ec ac 35 98 76 6f b9 05 de a2 13 8c 6d 48 7f 07 9e b1 36 a8 fb eb 5b 93 e2 59 6f 91 4f 35 81>,
    address: '0x09129dcde8e0f510ffb2a715709b69f5c4a42361',
    nonce: 0
}

/**
 * The user is automatically logged in after registering.  When logged in,
 * the user's data is kept in the the augur.web.account object.  Logging out
 * unsets the augur.web.account object.
 */

augur.web.logout();
console.log("Account:", augur.web.account);

// output
Account: {}

/* Logging in both sets and returns the augur.web.account object: */

augur.web.login(username, password, function (account) {
    console.log(augur.web.account);
});

// output
{
    handle: 'tinybike',
    privateKey: <Buffer 55 ec ac 35 98 76 6f b9 05 de a2 13 8c 6d 48 7f 07 9e b1 36 a8 fb eb 5b 93 e2 59 6f 91 4f 35 81>,
    address: '0x09129dcde8e0f510ffb2a715709b69f5c4a42361',
    nonce: 0
}
```

augur.js includes a trustless account management system.  The purpose of the accounts system is to allow people to use Augur without needing to run an Ethereum node themselves, as running a full Ethereum node can be resource-intensive.

The user specifies a username and password, and a private key (+ derived public key and address) is automatically generated for the user.  A secret key derived from the password using PBKDF2, along with a random 128-bit initialization vector, is used to encrypt the private key using AES-256.  The username, encrypted private key, and initialization vector are stored with [Firebase](https://www.firebase.com/).

<aside class="success">Our account system is <b>trustless</b> because only the user's encrypted key is stored.  The user's randomly-generated private key is encrypted using their password, then indexed by username and stored with Firebase.  The user's password is never stored (not even a hash of it), nor is their public key or their address.  Neither we nor Firebase have any access to the user's account.  We can't see your account balance, your transaction history, or anything else.</aside>

Transaction signing and serialization is entirely carried out in the browser using [ethereumjs-tx](https://github.com/ethereum/ethereumjs-tx) and the `eth_sendRawTransaction` RPC; the plaintext private key never touches our servers at any time.

Invoking contract methods is unchanged from normal use (from the client's perspective).  The Augur API functions can simply be called in the usual way (e.g., `augur.reputationFaucet`), and augur.js will default to client-side transactions if the user is logged in.

<aside class="notice">Since the user's account key is an ordinary Ethereum private key, the user's key (and therefore their funds and Reputation) can be used with any Ethereum node.  Therefore, although the accounts system is managed using an ordinary web server, since the user's funds are neither tied to nor controlled by our server, the accounts are still decentralized in the ways that (in our opinion) matter.</aside>
