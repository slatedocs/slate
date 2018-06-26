---
title: Building your own Venmo with Stellar

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='https://twitter.com/abuiles'>Follow me on Twitter @abuiles</a>
  - <a href='https://github.com/abuiles/building-your-own-venmo-with-stellar/issues'>Report issues</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>


includes:
  - errors

search: true
---
# Building your own Venmo with Stellar

<aside class="notice">
Work in progress!
</aside>

> This is a free tutorial, but I like to drink coffee while I write. You can buy my a coffee with XLM, send a tip here `GBCFAMVYPJTXHVWRFP7VO6F4QE7B4UHAVJOEG5VR6VEB5M67GHQGEEAB` with the memo `coffee`.

Welcome to building your own Venmo with Stellar. This guide will show
you how to create a product "similar" to Venmo using Stellar.

In Stellar, an entity like Venmo is called an `anchor`. When you are building an anchor, there are two suggested ways to build and maintain customer accounts:

1. Maintain a Stellar account for each customer.
2. Maintain a single Stellar account to transact on behalf of your customers and use the memo field to identify who is the recipient of each transaction.

The [official documentation](https://www.stellar.org/developers/guides/anchor/index.html#customer-accounts) covers the second method but there is no documentation about the first one.

In this tutorial you will use Stellar to build a low-cost financial service similar to Venmo and instead of following the approach number two which is already documented in the Stellar website, you'll be maintaining a Stellar account for each customer and also making it transparant to the final user that they are using Stellar.

The following are some of the goals in this tutorial:

1. The final user won't know about Stellar.
2. The final user won't need to store or worry about seed keys.
3. The final user won't transact with Lumens.
4. The system will use Lumens as "usage tokens". Each account needs Lumens to be able to use the Stellar ledger.
5. The final user will be depositing "fiat" into the financial instituion and getting "fiat" credited in their accounts.
6. The final user will hold an asset which represents American Dollars.
7. All the examples and the wallet will be running in the Stellar testnet.

<aside class="notice">
Anchors are entities that people trust to hold their deposits and issue credits into the Stellar network for those deposits.
</aside>

# Concepts

Before getting started you need to learn some concepts in Stellar like account, asset, anchor, multisignature.

## Account

The most important unit in Stellar are the accounts. You need to
create one before interacting with the network. To create an account
you need to deposit Lumens into it, you can get the Lumens buying them
in a exchange or asking a friend for some.

When you create an account, you get a public and private key. The
public key is the equivalent of your bank account number and then the
private key is the password. The private key is required to sign each
transaction.

For this tutorial, you'll be using accounts to create new assets and
also provision other users accounts as they signup for this Venmo
clone which will be called `AnchorX`. Although each user will have a Stellar account they won't know
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

You'll be creating a custom asset in the test network
(testnet) representing Dollars and you will build a way to credit and
debit accounts as if we were depositing Dollars.

You can learn more about assets in the SDF guides: [https://www.stellar.org/developers/guides/concepts/assets.html](https://www.stellar.org/developers/guides/concepts/assets.html)

## Anchor

At the beginning of this tutorial, you read that an entity like
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

In this tutorial, you will be creating an anchor which will issue an
asset representing USD. User will have to download an app, you'll fake a
KYC process and then create a Stellar account for the user and
authorize the user to hold the asset. Once the user have been
authorized they will be able to deposit USD or debit USD from their accounts.

You can learn more about anchors in the SDF guides: [https://www.stellar.org/developers/guides/anchor/](https://www.stellar.org/developers/guides/anchor/)

## Multisignature

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

# Anchor Setup

The following is high level overview of what happens when you want to use Venmo:

1. Download the app and create an user.
2. Go through KYC with phone number, email and bank account verification.
3. Once you are authorized to use Venmo, transfer money from your bank account and send it to other Venmo users.
4. Transfer to your bank whatever balance you have left.

Let's translate the steps above to actions in AnchorX and then identify the requirements to setup the anchor.

### Download the app and create an user.

Users should be able to download an app and then create an account. To
keep things simple, I'll be using React-Native with Expo and then use
a username (no password) as sign-up method.

### Go through KYC

In Venmo there is some level of KYC, since this is a toy example we
won't be including any formal KYC process. By default every user will
be marked as verified. In real life, you probably want to collect user
data like SSN, driver's license, passport, proof of residence, etc.

After an user creates an account with AnchorX, the service will
automatically provision a Stellar account and authorize the account to
hold the anchor's asset.

Stellar accounts can hold any asset, but additionally anchors can authorize who is allowed to hold their asset.

When a Stellar accounts decides to trust a given asset, they are
creating a trustline between the account and the asset. Such operation
has to be stored in the ledger. The code in the right shows a transaction creating a trustline between an `account` and an `asset`.

```javascript
const asset = new StellarSdk.Asset(
  'USD',
  'issuer-id'
);

new StellarSdk
  .TransactionBuilder(myAccount)
  .addOperation(
    StellarSdk.Operation.changeTrust({
      asset
    }))
  .build();
```

Likewise, when the asset issuer requires authorization by them before people can hold their asset. It needs to happen in an operation.
The code shows an operation where the issuing account is authorizing a `trustor` to hold its asset with code `USD`.

```javascript
const trustor = 'some-stellar-address'

new StellarSdk.TransactionBuilder(issuingAccount)
  .addOperation(
    StellarSdk.Operation.allowTrust({
      trustor,
      assetCode: 'USD',
      authorize: true
    })
  )
  .build();
```

For this example, `AnchorX` will be running both operations to allow accounts to transact with its asset.

### Credit from bank account

The app will have a section which will simulate transferring from your bank account.

### P2P payments

Once the account has been provisioned and have some Dollars, users should be able to send money to other users in AnchorX

### Transfer balance from AnchorX to Bank account

The app will have a section for depositing their dollars to their bank account.

# Building the backend

In this section, you'll be implementing a GraphQL API which will support user sign-up and sign-in, deposits, withdrawals and payments. The mobile application will be interacting with this API.

The server will be written in `TypeScript` and use [Prisma](https://www.prisma.io/) to generate the user management API.

## Setting up the server

In this section you can find a GraphQL server created with [GraphQL CLI](https://oss.prisma.io/content/graphql-cli/01-overview) and using the `TypeScript` template. To make things easy there is a release which you can use as starting point.

The following pull request contains the boostrapping step [https://github.com/abuiles/anchorx-api/pull/1](https://github.com/abuiles/anchorx-api/pull/1). You can get it by running the following commands:

1. `git clone https://github.com/abuiles/anchorx-api`
2. `cd anchorx-api`
3. `git checkout v1`

Next you are going to add the user model.

## User model

The user model is defined in `database/datamodel.graphql`. Users in AnchorX signup using their username. After they signup, the service assigns automatically a Stellar account. The code on the right is the prisma representaion for the user model.

```javascript
type User {
  id: ID! @unique
  username: String! @unique
  stellarAccount: String!
  stellarSeed: String!
}
```

After adding the user model definition to `database/datamodel.graphql`, you have to run `yarn prisma deploy` to create a new table in the database and get the CRUD end-points for users.

The [pull request #2](https://github.com/abuiles/anchorx-api/pull/2), shows the changes added in this step. The important changes are [https://github.com/abuiles/anchorx-api/pull/2/files#diff-5ca8cc3ddf0d92dda0872ee778220e21](https://github.com/abuiles/anchorx-api/pull/2/files#diff-5ca8cc3ddf0d92dda0872ee778220e21), the rest is code generated by prisma.

Next you need to add a GraphQL mutation to support user signup. After a new user is created, you need to provision a Stellar account. Provisioning a new account requires multiple steps:

1. Create a public and private key pair.
2. After the public key has been created, fund that account with some Lumens.
3. After the account has been created in the Stellar ledger, create a trustline with the anchor asset.

## User signup mutation

> Edit src/schema.graphql to define the schema

```javascript
# import User from './generated/prisma.graphql'

type Query {
  user(username: String!): User
}

type Mutation {
  signup(username: String!): User!
}
```

> Define the resolvers and query in `src/index.ts`. [Commit 5d6e91](https://github.com/abuiles/anchorx-api/commit/5d6e9155d42c8e07c4c08bb627fdb48613d67e53) shows the changes in the `Mutation` and [commit 3d3fff](https://github.com/abuiles/anchorx-api/commit/3d3ffffeec77f1e69965d014989379f733b1d65b) shows the changes in the `Query`

```javascript
const resolvers = {
  Query: {
    user(_, { username }, context: Context, info) {
      return context.db.query.user(
        {
          where: {
            username
          }
        },
        info
      )
    }
  },
  Mutation: {
    signup(_, { username }, context: Context, info) {
      const data = {
        username,
        stellarAccount: '1234',
        stellarSeed: '1234'
      }

      return context.db.mutation.createUser(
        { data },
        info
      )
    },
  },
}
```

In this section you will start defining the GraphQL schema and define the resolvers.

Start by defining a mutation called `signup` and a query called `user`. The first one takes a username and returns an `User` instance and the second one allows you to retrieve an user given their username.

Next you need to add the code in the resolvers to support signup and user find, open the file `src/index.ts` and make sure that it looks like the code on the right. There are links to diffs included so you can see exactly what changed. For this tutorial [Prisma](https://www.prisma.io) is taking care of the database and ORM setup.

In the mutation signup, you'll notice that `stellarAccount` and `stellarSeed` have a fixed value of `1234`, that's just a placeholder. In the next section will add the `JS Stellar SDK` and use it to generate the account and the seed, also we'll add a fake service to encrypt the seed before saving it to the database.

You can see all the changes in this section in [pull request #3](https://github.com/abuiles/anchorx-api/pull/3/files)

## Assigning a Stellar account to new users

> Install the stellar-sdk and then the TypeScript types for the stellar-sdk

```
yarn add stellar-sdk
yarn add @types/stellar-sdk
```

When a user signup the service will generate a Stellar account. First you need to install the `JS Stellar SDK` and the types definitions for `TypeScript`.

After installing the SDK, you need to change the signup mutation so it generates a real public key and seed. To do so, the `Stellar SDK` has a class called [Keypair](https://stellar.github.io/js-stellar-sdk/Keypair.html). You'll need to import Keypair and then call `Keypair.random()` to generate a new pair.

On the right you can  see the changes to `src/index.ts`.

```javascript
 import { importSchema } from 'graphql-import'
 import { Prisma } from './generated/prisma'
 import { Context } from './utils'
+import { Keypair } from 'stellar-sdk'

 const resolvers = {
   Query: {
    ...
   },
   Mutation: {
     signup(_, { username }, context: Context, info) {
+      const keypair = Keypair.random()
+
       const data = {
         username,
+        stellarAccount: keypair.publicKey(),
+        stellarSeed: keypair.secret()
       }

       ...
```

You should never store seed keys as plain text. In a production app you should probably be using something like Google or AWS KMS and have a clear set of restrictions of who can encrypt or decrypt. In this tutorial you'll be using an encryption module for Node called `crypto-js`. In the next section you will add the module and encrypt the seed before saving it.


## Encrypting the seed

> Add the crypto-js module with its types.

```
yarn add crypto-js
yarn add @types/crypto-js
```

> Use crypto-js before storing the seed key

```javascript
 import { Prisma } from './generated/prisma'
 import { Context } from './utils'
 import { Keypair } from 'stellar-sdk'
+import { AES } from 'crypto-js'

 const resolvers = {
   Query: {
     signup(_, { username }, context: Context, info) {
       const keypair = Keypair.random()

+      const configCryptoScret = 'StellarIsAwesome-But-Do-Not-Put-This-Value-In-Code'
+
+      const secret = AES.encrypt(
+        keypair.secret(),
+        configCryptoScret
+      ).toString()
+
       const data = {
         username,
         stellarAccount: keypair.publicKey(),
-        stellarSeed: keypair.secret()
+        stellarSeed: secret
       }

       ...
```

Install `crypto-js` and after that you can use it in the `signup` mutation to store the encrypted seed.

<aside class="notice">
For production applications never put any kind of keys in code and use something like Google KMS or AWS KMS to store data securely! You can find a production ready example in StellarGuard. Check the code <a href="https://github.com/stellarguard/stellarguard/blob/master/src/server/lib/utils/crypto.js#L25">here</a>
</aside>

You can see the changes from the previous two sections in [pull request #4](https://github.com/abuiles/anchorx-api/pull/4)

## Testing

```javascript
mutation {
  signup(username: "test") {
    id,
    username,
    stellarSeed,
    stellarAccount
  }
}
```

You can test the changes made up to this point by running the server. To do so type the command `yarn dev` in your console and it will bring a GraphQL playground to your browser. You can test the `signup mutation` by pasting the code in the right and hitting run.

## Funding the new account

## Creating trustlines
Implementation of Stellar trustlines

## Credit account
API end-point to "transfer" USD from bank account to Stellar account.
## Payments
API end-point to transfer money from user a to user b
## Debit account
API end-point to transfer money from AnchorX to bank account.

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
