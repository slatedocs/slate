---
title: Building your own Venmo with Stellar

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='https://twitter.com/abuiles'>Follow me on on Twitter @abuiles</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---
# Building your own Venmo with Stellar
<aside class="notice">
This is a work in progress!
</aside>


- You can report issues in the GitHub repo [cliking here](https://github.com/abuiles/building-your-own-venmo-with-stellar/issues)
- You support my work sending XLM tips here `GBCFAMVYPJTXHVWRFP7VO6F4QE7B4UHAVJOEG5VR6VEB5M67GHQGEEAB`.

Welcome to building your own Venmo with Stellar. This guide will show
you how to create a product "similar" to Venmo using Stellar.

In Stellar, an entity like Venmo is called an Anchor.

The [official documentation](https://www.stellar.org/developers/guides/anchor/index.html#customer-accounts) to create an anchor suggests two ways to maintain customers accounts:

1. Maintain a Stellar account for each customer.
2. Maintain a single account and use the memo field to identify who is the recipient.

The documentation then expands on the second method without covering the first one.

My goal is to create the missing guide following the first method mantaining a Stellar account for each customer.

I'll be using Stellar to build a low-cost financial service. Unlike other wallets, I won't expose to the final user the fact that we are using Stellar.

The following are some of the goals in this tutorial:

1. The final user will not know about Stellar.
2. The final user will not need to store or worry about seed keys.
3. The final user will not transact with Lumens.
4. The system will use Lumens as "usage tokens". Each account needs Lumens to be able to use the Stellar ledger.
5. The final user will be depositing "fiat" into the financial instituion and getting "fiat" credited in their accounts
6. The final user will hold an asset which represents American Dollars.
7. All the examples and the wallet will be running in the Stellar testnet.

<aside class="notice">
Anchors are entities that people trust to hold their deposits and issue credits into the Stellar network for those deposits.
</aside>

# Concepts

Before getting started I'd like to introduce some important concepts
in Stellar like account, asset, anchor, multisignature.

## Account

The most important unit in Stellar are the accounts. You need to
create one before interacting with the network. To create an account
you need to deposit Lumens into it, you can get the Lumens buying them
in a exchange or asking a friend for some.

When you create an account, you get a public and private key. The
public key is the equivalent of your bank account number and then the
private key is the password. The private key is required to sign each
transaction.

For this tutorial, I'll be using accounts to create new assets and
also provision other users accounts as they signup for our Venmo
clone. Although each user will have a Stellar account they won't know
about it.

### Creating accounts in the test network
```javascript
const StellarSdk = require('stellar-sdk')
const fetch = require('node-fetch')

// Generates a keypair and funds account with friendbot
async function createAccount() {
  const pair = StellarSdk.Keypair.random()
  console.log('Requesting Lumens')

  await fetch(`https://horizon-testnet.stellar.org/friendbot?addr=${pair.publicKey()}`)

  return pair
}

async function run() {
  const pair = await createAccount()

  console.log(`
    Congrats, you have a Stellar account in the test network!
    seed: ${pair.secret()}
    id: ${pair.publicKey()}
  `)

  const url = `https://horizon-testnet.stellar.org/accounts/${pair.publicKey()}`

  console.log(`
    Loading account from test network:
    ${url}
  `)

  const response = await fetch(url)
  const payload = await response.json()

  console.log(payload)
}

run()
```
> Run it on repl.it [https://repl.it/@abuiles/CreateStellarAccount](https://repl.it/@abuiles/CreateStellarAccount)

On the right you can see how to generate a `keypair` with the `Stellar JS SDK` and then ask a service run by the Stellar Development Foundation called `friendbot` to give us some initial Lumens.

## Assets
```json
// https://horizon.stellar.org/accounts/GBCFAMVYPJTXHVWRFP7VO6F4QE7B4UHAVJOEG5VR6VEB5M67GHQGEEAB
{
  "id": "GBCFAMVYPJTXHVWRFP7VO6F4QE7B4UHAVJOEG5VR6VEB5M67GHQGEEAB",
  "account_id": "GBCFAMVYPJTXHVWRFP7VO6F4QE7B4UHAVJOEG5VR6VEB5M67GHQGEEAB",
  "balances": [
    {
      "balance": "0.0000000",
      "limit": "922337203685.4775807",
      "asset_type": "credit_alphanum4",
      "asset_code": "MOBI",
      "asset_issuer": "GA6HCMBLTZS5VYYBCATRBRZ3BZJMAFUDKYYF6AH6MVCMGWMRDNSWJPIH"
    },
    {
      "balance": "0.0000000",
      "limit": "922337203685.4775807",
      "asset_type": "credit_alphanum4",
      "asset_code": "EURT",
      "asset_issuer": "GAP5LETOV6YIE62YAM56STDANPRDO7ZFDBGSNHJQIYGGKSMOZAHOOS2S"
    },
    {
      "balance": "0.0000000",
      "limit": "922337203685.4775807",
      "asset_type": "credit_alphanum4",
      "asset_code": "ETH",
      "asset_issuer": "GBDEVU63Y6NTHJQQZIKVTC23NWLQVP3WJ2RI2OTSJTNYOIGICST6DUXR"
    },
    {
      "balance": "0.0000000",
      "limit": "922337203685.4775807",
      "asset_type": "credit_alphanum4",
      "asset_code": "USD",
      "asset_issuer": "GBSTRH4QOTWNSVA6E4HFERETX4ZLSR3CIUBLK7AXYII277PFJC4BBYOG"
    },
    {
      "balance": "57.9899400",
      "asset_type": "native"
    }
  ]
}
```
The Stellar network allows us to represent any kind of asset. All assets
in Stellar can be traded and exchanged with each other.

Like other protocols, Stellar has a native asset which is called the
`Lumen` represented with the symbol `XLM`. Stellar accounts can hold
multiple assets as long as they trust the asset and in some
cases they have been authorized to hold the asset.

Any account can create their own asset representing traditional or custom (work/usage/hybrid) of assets.

Traditional assets are a cryptographic representation of things like
fiat, equity, real estate, goats, you name it.

Lumens are an example of a custom asset or token, at they allow us to
interact with the Stellar network. There are many other types of
assets built on top of Stellar, one example is the `EURT` which is a
representation of the `EURO` and allows people to do cross-border
remittances without incurring in high transaction fees. There is also
`MOBI` which allows people to use the `Mobius network`, if you hold `MOBI` then
your can interact with the applications in their network.

On the right you can see the JSON representation of a Stellar
account. Each account has a key called balances, representing the
assets held by the account.

The account on the right has the following assets:

- MOBI: Asset issued by [Mobius network](https://mobius.network/)
- EURT: Asset issued by [Tempo](http://tempo.eu.com/) a remittances company.
- ETH: This asset represents Ether, you send real `ETH` to [http://papaya.io/](http://papaya.io/) and they credit you with their `ETH` asset in your Stellar account.
- USD: Asset representing `Dollars`, issued by [Stronghold](https://stronghold.co/).
- native: Native asset of the network, it represents `Lumens`.

Assets in Stellar are representet by a combination of `code` and `issuer`. It is possible then to find two assets with the code `USD` representing Dollars but one can be issued by Bank Of America and the other by Venmo.

It is also possible to find multiple assets with the code `BTC`, where one
can be backed by [http://papaya.io/](http://papaya.io/) and the other
one from [StrongHold](https://stronghold.co/). It means that at some
point the issuer (also known as anchor) received `BTC` in their
Bitcoin wallets and then credited with their equivalent representation
of Bitcoin your Stellar account. If you visit the following site, [https://stellar.expert/explorer/public/asset](https://stellar.expert/explorer/public/asset) you'll find all the assets issued in Stellar.

For this tutorial, I'll be creating a custom asset in the test network
(testnet) representing Dollars and I'll build a way to credit and
debit accounts as if we were depositing Dollars.

You can learn more about assets in the SDF guides: [https://www.stellar.org/developers/guides/concepts/assets.html](https://www.stellar.org/developers/guides/concepts/assets.html)

## Anchor

At the beginning of this tutorial, I mentioned that an entity like
Venmo is called an anchor.  Anchors issue assets on top of Stellar and
then credit those asset to other Stellar accounts. If the anchor
represents fiat, then it is likely an authorized entity to deal with
money like banks, savings and credit institutions or a
remittance company. User deposit fiat to the anchor's account and they
credit the user Stellar account with the equivalent balance.

This is how banks or Venmo works but instead of using a public ledger
like Stellar, they have their own private system and use third parties
like ACH or SWIFT to move money around.

Anchors can represent also other cryptocurrencies. [Papaya](https://apay.io/) is an anchor which includes support for cryptocurrencies like `ETH`, `BTC` and others.

If you want to deposit Ether, they give you an Ethereum address. After you deposit Ether to that address they issue the equivalent to your Stellar account. In this case you'll have to trust Papaya because they'll be acting as custodian for the Ether you sent them.

For this tutorial, I'll be creating an anchor which will issue an
asset representing USD. User will have to download an app, I'll fake a
KYC process and then create a Stellar account for the user and
authorize the user to hold the asset. Once the user have been
authorized they will be able to deposit USD or debit USD from their accounts.

You can learn more about anchors in the SDF guides: [https://www.stellar.org/developers/guides/anchor/](https://www.stellar.org/developers/guides/anchor/)

## Multisignature

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

# Anchor Setup

From this moment, I'll give a name to this Venmo clone. It would be called: `AnchorX`.

The following is high level overview of what happens when you want to use Venmo:

1. Download the app and create an user.
2. Go through KYC with phone number, email and bank account verification.
3. Once you are authorized to use Venmo, transfer money from your bank account and send it to other Venmo users.
4. Transfer to your bank whatever balance you have left.

Let's translate the steps above to actions in AnchorX and write what happens in Stellar and backend systems.

1. Download the app and create an user.
2. Go through KYC.
3. Once you are authorized to use AnchorX, transfer money from your bank account and send it to other AnchorX users.
4. Transfer to your bank whatever balance you have left.


### Download the app and create an user

There is nothing special here, we just add a new user to our database
and put it in some kind of pending state for verification.

### Go through KYC with phone number, email and bank account verification

The user is required to confirm their identity before being able to
use `AnchorX`. Once the user confirms their identity then they can
start using the app.

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


## Creating an user account
## Adding a trustline
## Setting up multisignature

# Building the mobile wallet
## Using the Stellar-SDK in React-Native
Introduce the Stellar-SDK polyfill and how to display an account data in a RN app.
## Creating an user signup flow
Very simple user signup flow based in user name. It shows how to setup Stellar account, multisig and trustline schema.
## Depositing "fiat" into your wallet
 A fake implementation in the wallet similar to transferring money from a bank.
## Showing account transactions
Implements the transaction history in the RN wallet.
## Sending payments
Flow for doing P2P payments.
## Cashing out
Fake implementation for transferring money to the bank accountp
# Security
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.
## Infrastructure
## Keeping keys secure
