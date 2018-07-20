---
title: Building your own Venmo with Stellar

language_tabs: # must be one of https://git.io/vQNgJ
  - javascript

toc_footers:
  - <a href='https://twitter.com/abuiles'>Follow me on Twitter @abuiles</a>
  - <a href='https://blog.abuiles.com/consulting'>Stellar consulting</a>
  - <a href='https://github.com/abuiles/building-your-own-venmo-with-stellar/issues'>Report issues</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>


includes:
  - errors

search: true
---
# Building your own Venmo with Stellar

<aside class="notice">
Work in progress  ███████░░░ 70%
</aside>

Welcome to building your own Venmo with Stellar. This guide will show you how to create a product "similar" to Venmo using Stellar.

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

In this section you can find a GraphQL server created with [GraphQL CLI](https://oss.prisma.io/content/graphql-cli/01-overview) and using the `TypeScript` template. To make things easy there is boilerplate project which you can use to get started.

Download the boilerplate running the following commands:

1. `git clone https://github.com/abuiles/anchorx-api-boilerplate anchorx-api`
2. `cd anchorx-api`

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

AnchorX allows you now to create new users and it assigns a stellar account to each user. However, the Stellar account is not created in the Stellar ledger until it gets funded with some lumens.

The GIF below, shows you the process of creating an account and what happens when you try to look at that account on the stellar test network.

The result is a 404 since you never funded the Stellar account.

![](https://d3vv6lp55qjaqc.cloudfront.net/items/0D2x0C3Y3i2C0J2q1i1L/Screen%20Recording%202018-06-28%20at%2011.14%20AM.gif?X-CloudApp-Visitor-Id=49274&v=df174936)

To fix this, AnchorX needs to fund each account with enough lumens to
keep the minimum account balance and then be able to do
transactions. In the next section you will learn how to create account
programatically in Stellar without `friendbot`.

<aside class="notice">
Lear more about minimum account balance <a href="https://www.stellar.org/developers/guides/concepts/fees.html#minimum-account-balance">here</a>
</aside>

## Creating the account in the Stellar ledger

```javascript
// Classes required to create new account
import {
  Keypair, // Keypair represents public and secret keys.
  Network, // Network provides helper methods to get the passphrase or id for different stellar networks.
  Operation, // Operation helps you represent/build operations in Stellar network.
  Server, // Server handles the network connections.
  TransactionBuilder // Helps you construct transactions.
} from 'stellar-sdk'

try {
  // Tell the Stellar SDK you are using the testnet
  Network.useTestNetwork();
  // point to testnet host
  const stellarServer = new Server('https://horizon-testnet.stellar.org');

  // Never put values like the an account seed in code.
  const provisionerKeyPair = Keypair.fromSecret('SA72TGXRHE26WC5G5MTNURFUFBHZHTIQKF5AQWRXJMJGZUF4XY6HFWJ4')

  // Load account from Stellar
  const provisioner = await stellarServer.loadAccount(provisionerKeyPair.publicKey())

  console.log('creating account in ledger', keypair.publicKey())
  const transaction = new TransactionBuilder(provisioner)
        .addOperation(
          // Operation to create new accounts
          Operation.createAccount({
            destination: keypair.publicKey(),
            startingBalance: '2'
          })
        ).build()

  // Sign the transaction above
  transaction.sign(provisionerKeyPair)

  // Submit transaction to the server
  const result = await stellarServer.submitTransaction(transaction);
  console.log('Account created: ', result)
} catch (e) {
  console.log('Stellar account not created.', e)
}
```
The Stellar SDK includes a transaction builder which helps you create operations. To create an account, you'll need to use the [createAccount operation](https://stellar.github.io/js-stellar-sdk/Operation.html#.createAccount). The code on the right includes the relevant pieces to create a new account programmatically.

You can follow along and read the comment on what each line represents. After that you'll need to use that code in the context of the signup mutation to create the account in the Stellar ledger.

You need to extend the signup mutation to fund the user's account after it has been created successfully.

You can find in [pull request #5](https://github.com/abuiles/anchorx-api/pull/5) the change in the mutation using the create account operation.

<aside class="notice">
In a production app, you probably want to have all the code interacting with Stellar accounts and secret keys in a different service like AWS Lambda. Also make use of AWS IAM policies, KMS and force MFA.
</aside>

## Payments

```javascript
 import {
 + Asset,
   Keypair,
 + Memo
   Network,
   Operation,
   Server,
   TransactionBuilder
 } from 'stellar-sdk'

 import {
   AES,
 + enc
 } from 'crypto-js'xo

 const ENVCryptoSecret = 'StellarIsAwesome-But-Do-Not-Put-This-Value-In-Code'

   mutations: { ...
+    async payment(_, { amount, senderUsername, recipientUsername, memo }, context: Context, info) {
+      // Load users from database
+      const result = await context.db.query.users({
+        where: {
+          username_in: [senderUsername, recipientUsername]
+        }
+      })
+
+      const sender = result.find(u => u.username === senderUsername)
+      const recipient = result.find(u => u.username === recipientUsername)
+
+      Network.useTestNetwork();
+      const stellarServer = new Server('https://horizon-testnet.stellar.org');
+
+      // build the keypair required to sign the payment transaction
+      const signerKeys = Keypair.fromSecret(
+        // Use something like KMS in production
+        AES.decrypt(
+          recipient.stellarSeed,
+          ENVCryptoSecret
+        ).toString(enc.Utf8)
+      )
+
+      // Load Stellar account from ledger
+      const account = await stellarServer.loadAccount(sender.stellarAccount)
+
+      /*
+        Payments require an asset type, for now users will be sending
+        lumens. In the next chapter you'll create a custom asset
+        representing Dollars and use it.
+      */
+      const asset = Asset.native()
+
+      let transaction = new TransactionBuilder(account)
+        .addOperation(
+          Operation.payment({
+            destination: sender.stellarAccount,
+            asset,
+            amount
+          })
+        ).build()
+
+      transaction.sign(signerKeys)
+
+      try {
+        const { hash } = await stellarServer.submitTransaction(transaction)
+
+        return { id: hash }
+      } catch (e) {
+        console.log(`failure ${e}`)
+
+        throw e
+      }
+    }
   },
 }
```

In Venmo you can send payments using the recipient's phone number,
email or username. In AnchorX users will be sending money to each
other using their usernames. To keep things simple, you won't
implement any kind of session management which means you'll have to
tell the API explicitly who is the sender and the recipient. For
production apps this is very BAD IDEA, but the goal here is not to
build an user management or Authn/Authz system.

To send a payment in Stellar, you need the recipient's Stellar account
and source account secret.

The code in the right shows the mutation to create new payments. It
takes the sender and recipient username as parameters. It loads first
the user's data from the database, decrypts the sender seed and then
signs the transaction to submit a payment.

<aside class="notice">
If you are freaking out about decrypting the seed and signing the
transaction with it, don't worry. You will learn more about other ways
to deal with account seeds and signing transactions in a different section.
</aside>

Payments are created using the payment `payment` function from the
`Operation` class. You can see it takes the destination, the
asset and the amount.

Since Stellar accounts can hold multiple assets you need to specify
which of the assets held by an account you are trying to transfer. For
now the operation is sending lumens. In AnchorX, users won't be
sending lumens to each other but the custom asset representing USD.

In the upcoming sections you will:

 - Create a custom asset representing Dollars.
 - Learn how to allow accounts to hold that asset.
 - Implement the `creditAccount` mutation which simulates transferring Dollars from the user bank account to AnchorX.
 - Change the payment mutation to send USD instead of lumens.

[Pull request #7](https://github.com/abuiles/anchorx-api/pull/7) includes all the changes introduced in this section.

## Issuing AnchorX custom asset

In this section you'll learn the high level details of issuing a new asset and how to allow other accounts to hold your asset. Stellar's official documentation has a great guide about issuing assets so this tutorial won't repeat the same. You can read more about it here [https://www.stellar.org/developers/guides/issuing-assets.html](https://www.stellar.org/developers/guides/issuing-assets.html)

To create an asset you'll need an asset code and an issuing account.

The asset code needs a short identifier, for national currencies you need to use an [ISO 4217 code](https://en.wikipedia.org/wiki/ISO_4217). AnchorX asset will use the code `USD`.

The issuing account can emit new `USD`, give it to other accounts and impose some controls around it. In this tutorial the issuing account will be `GBX67BEOABQAELIP2XTC6JXHJPASKYCIQNS7WF6GWPSCBEAJEK74HK36` with seed `SBYZ5NEJ34Y3FTKADVBO3Y76U6VLTREJSW4MXYCVMUBTL2K3V4Y644UX`.

Before an account can hold a given asset, it needs to explicitly create
an operation expressing that it trust the asset with code `USD`
created by the issuing account
`GBX67BEOABQAELIP2XTC6JXHJPASKYCIQNS7WF6GWPSCBEAJEK74HK36`, such
operation is called creating a `trustline`.

The issuer can set a condition where it needs to authorize accounts
before they can hold its asset, this is useful if you only want people
who are your clients or have gone through your KYC process to transact
with your asset. In this scenario you need two trustlines one from the customer's account to your issuing account and then one from your issuing account to the customer's account.

## Setting up issuing account

```javascript
import {
  AuthRequiredFlag,
  AuthRevocableFlag,
  Server,
  Keypair,
  Network,
  Operation,
  TransactionBuilder,
  xdr
} from 'stellar-sdk'

async function setupIssuer() {
  Network.useTestNetwork()

  const stellarServer = new Server('https://horizon-testnet.stellar.org')
  const issuerKeyPair = Keypair.fromSecret('SBYZ5NEJ34Y3FTKADVBO3Y76U6VLTREJSW4MXYCVMUBTL2K3V4Y644UX')
  const issuingAccount = await stellarServer.loadAccount(issuerKeyPair.publicKey())

  var transaction = new TransactionBuilder(issuingAccount)
      .addOperation(
        Operation.setOptions({
          setFlags: AuthRevocableFlag | AuthRequiredFlag
        }))
      .build()

  transaction.sign(issuerKeyPair)
  await stellarServer.submitTransaction(transaction)

  console.log('All set!')
}

setupIssuer()

```

The code on the right shows you the basic setup for an account before creating an asset. In it, you are setting the `AuthRequiredFlag` which requires the trustline from the issuer to the holder and `AuthRevocableFlag` which allows you to freeze the user's access to your asset. You can read more about both flags [here](https://www.stellar.org/developers/guides/concepts/assets.html#controlling-asset-holders). Since this is something which is done once, this is not included in the GitHub repo. You can try it in [Repl.it](https://repl.it/@abuiles/SetupAnchorFlags)

Next you need to extend the signup mutation to create both trustlines when an user creates a new account.

## Creating a trustline

```javascript
import {
  Asset,
  Keypair,
  Network,
  Operation,
  Server,
  TransactionBuilder
} from 'stellar-sdk'

export async function createTrustline(accountKeypair) {
  Network.useTestNetwork();
  const stellarServer = new Server('https://horizon-testnet.stellar.org');

  try {
    const account = await stellarServer.loadAccount(accountKeypair.publicKey())
    const transaction = new TransactionBuilder(account)
      .addOperation(
        Operation.changeTrust({
          asset: AnchorXUSD
        }))
      .build();

    transaction.sign(accountKeypair)

    const result = await stellarServer.submitTransaction(transaction)

    console.log('trustline created from  account to issuer and signers updated', result)

    return result
  } catch (e) {
    console.log('create trustline failed.', e)
  }
}
```

The code on the right shows you how to create a trustline from an account to the issuer account. You'll be using that function inside the signup mutation.

Now after you create a new user, you will also create a trustline from the new account to AnchorX asset. You are not done yet, although the account accepts AnchorX `USD`, if you try to send `USD` to that account it won't work because the account hasn't been authorized to hold the asset.

After a trustline is created, you'll see the custom asset in the account's balance.

The following GIF shows you an account's state after it gets created without the trustline to AnchorX asset. You can see that the balance key only shows native.

![](https://d3vv6lp55qjaqc.cloudfront.net/items/113r1e353x3S1s1V2k2I/Screen%20Recording%202018-07-09%20at%2002.56%20PM.gif?X-CloudApp-Visitor-Id=49274&v=559df5f9)

And the next one will show you what happens in the account after creating the trustline.

![](https://d3vv6lp55qjaqc.cloudfront.net/items/0r2R1z2h2g2p2t3L3O0m/Screen%20Recording%202018-07-09%20at%2003.00%20PM.gif?X-CloudApp-Visitor-Id=49274&v=a19639ff)

You can see the changes from this section in [pull request #8](https://github.com/abuiles/anchorx-api/pull/8).

## Allow trustline

```javascript
export async function allowTrust(trustor) {
  Network.useTestNetwork();
  const stellarServer = new Server('https://horizon-testnet.stellar.org');

  try {
    // Never store secrets in code! Use something like KMS and put
    // this somewhere were few people can access it.
    const issuingKeys = Keypair.fromSecret('SBYZ5NEJ34Y3FTKADVBO3Y76U6VLTREJSW4MXYCVMUBTL2K3V4Y644UX')
    const issuingAccount = await stellarServer.loadAccount(issuingKeys.publicKey())

    const transaction = new TransactionBuilder(issuingAccount)
      .addOperation(
        Operation.allowTrust({
          trustor,
          assetCode: AnchorXUSD.code,
          authorize: true
        })
      )
      .build();

    transaction.sign(issuingKeys);

    const result = await stellarServer.submitTransaction(transaction)

    console.log('trust allowed', result)

    return result
  } catch (e) {
    console.log('allow trust failed', e)
  }
}
```

On the right you can see the allow trust operation in used. It
receives the public key of the account that you want to authorize and
the asset's code.

Now you can use that function after calling `createTrustline`. [Pull request #9](https://github.com/abuiles/anchorx-api/pull/9/files) shows you how to use the `allowTrust` function inside the signup mutation.

## Welcome balance

```javascript
export async function payment(signerKeys: Keypair, destination: string, amount: string) {
  Network.useTestNetwork();
  const stellarServer = new Server('https://horizon-testnet.stellar.org');

  const account = await stellarServer.loadAccount(signerKeys.publicKey())

  let transaction = new TransactionBuilder(account)
    .addOperation(
      Operation.payment({
        destination,
        asset: AnchorXUSD,
        amount
      })
    ).addMemo(Memo.text('https://goo.gl/6pDRPi'))
    .build()

  transaction.sign(signerKeys)

  try {
    const { hash } = await stellarServer.submitTransaction(transaction)

    return { id: hash }
  } catch (e) {
    console.log(`failure ${e}`)
    throw e
  }
}
```

In theory, AnchorX and the Stellar accounts it creates are ready to
receive and send `USD`. AnchorX's growth hackers have decided that the
best way to bring people to the platform is by giving each user a
welcome bonus of $10 USD.

You need to extend the signup mutation to send new users $10 USD. Add the function on the right to utils and then call it after the allow trustline operation.

The function takes the signing keys for the account to be debited, the destination account and the amount.

<aside class="notice">
You might have noticed the use of the issuing account to send the welcome bonus. In practice this is a bad idea, since if that account gets compromised, it means all AnchorX operations will be compromised. You'll learn more about how to deal with this situation later. If you can't wait, check [the account structure guide](https://www.stellar.org/developers/guides/anchor/index.html#account-structure) in the official docs.
</aside>

You can use the payment function inside the signup mutation.

The following GIF show you how after creating new accounts, they end up with $10 USD in their balance.

![](https://d3vv6lp55qjaqc.cloudfront.net/items/0n1c1o2o0F2P2H0c3K1b/Screen%20Recording%202018-07-09%20at%2004.41%20PM.gif?X-CloudApp-Visitor-Id=49274&v=c08071af)

[Pull request #10](https://github.com/abuiles/anchorx-api/pull/10)
includes all the changes introduced in this section. Now that AnchorX
users can hold USD, let's replace the payment mutation to send USD and
also give them a way to debit or credit their accounts.

## Paying with USD

```javascript
    async payment(_, { amount, senderUsername, recipientUsername, memo }, context: Context, info) {
      const result = await context.db.query.users({
        where: {
          username_in: [senderUsername, recipientUsername]
        }
      })

      const sender = result.find(u => u.username === senderUsername)
      const recipient = result.find(u => u.username === recipientUsername)

      const signerKeys = Keypair.fromSecret(
        // Use something like KMS in production
        AES.decrypt(
          sender.stellarSeed,
          ENVCryptoSecret
        ).toString(enc.Utf8)
      )

      try {
        const { hash } = await payment(
          signerKeys,
          recipient.stellarAccount,
          amount
        )

        return { id: hash }
      } catch (e) {
        console.log(`failure ${e}`)

        throw e
      }
    }
  }
```

You have a payment mutation to allow people to send money between each other. Until now it was sending the native asset but since users can hold USD you need to replace it to send USD. To do so, you can use the payment function from the previous section.

The code on the right shows you the new version of the payment mutation, which uses the `payment` function.

The following GIF show you the payment mutation in action.

![](https://d3vv6lp55qjaqc.cloudfront.net/items/2m06171D3o3x1O2p3c3Z/Screen%20Recording%202018-07-09%20at%2005.06%20PM.gif?X-CloudApp-Visitor-Id=49274&v=e39af9cd)

[Pull request #11[(https://github.com/abuiles/anchorx-api/pull/11) shows you the changes introduced in this section.

## Credit account

```javascript
async credit(_, { amount, username }, context: Context, info) {
      const user = await context.db.query.user({
        where: {
          username: username
        }
      })

      try {
        const { hash } = await payment(
          // keypair for issuing account - no bueno
          Keypair.fromSecret('SBYZ5NEJ34Y3FTKADVBO3Y76U6VLTREJSW4MXYCVMUBTL2K3V4Y644UX'),
          user.stellarAccount,
          amount
        )

        return { id: hash }
      } catch (e) {
        console.log(`failure ${e}`)

        throw e
      }
    }
```

In this section you will implement a new mutation to credit an user's account with `USD`. This mutation simulates a callback which would have been called if you were integrating your system with ACH or a similar system. In the context of the tutorial, this will be called when the user sends money from their bank account to AnchorX.

The mutation takes the username and the amount to be credited. Since you are using the issues keys, you can see that every time a new credit happens, the amount of `USD` minted increases.

To see how much is in circulation for a given asset you can visit the [horizon end-point for assets](https://www.stellar.org/developers/horizon/reference/resources/asset.html) filtering by code and issuer. The URL for AnchorX `USD` is the following [https://horizon-testnet.stellar.org/assets?order=desc&asset_code=USD&asset_issuer=GBX67BEOABQAELIP2XTC6JXHJPASKYCIQNS7WF6GWPSCBEAJEK74HK36](https://horizon-testnet.stellar.org/assets?order=desc&asset_code=USD&asset_issuer=GBX67BEOABQAELIP2XTC6JXHJPASKYCIQNS7WF6GWPSCBEAJEK74HK36)

The code in the right shows you the mutation and [pull request #12](https://github.com/abuiles/anchorx-api/pull/12) includes the change in the project.

The GIF below shows you the credit mutation in action and how the amount of `USD` increases after you credit accounts.

![](https://d3vv6lp55qjaqc.cloudfront.net/items/252J2G111Q1a261j2D1X/Screen%20Recording%202018-07-10%20at%2010.57%20AM.gif?X-CloudApp-Visitor-Id=49274&v=7b4cf1e8)

## Debit account

```javascript
async debit(_, { amount, username }, context: Context, info) {
      const user = await context.db.query.user({
        where: {
          username: username
        }
      })

      const keypair = Keypair.fromSecret(
        AES.decrypt(
          user.stellarSeed,
          ENVCryptoSecret
        ).toString(enc.Utf8)
      )

      // When you send back a custom asset to the issuing account, the
      // asset you send back get destroyed
      const issuingAccount = 'GBX67BEOABQAELIP2XTC6JXHJPASKYCIQNS7WF6GWPSCBEAJEK74HK36'

      try {
        const { hash } = await payment(
          keypair,
          issuingAccount,
          amount
        )

        console.log(`account ${keypair.publicKey()} debited - now transfer real money to ${username} bank account`)

        return { id: hash }
      } catch (e) {
        console.log(`failure ${e}`)

        throw e
      }
    }
```

In this section you will implement a new mutation to debit money from an user's account. This mutation simulates a callback which would have been called if you were integrating sending money to user's bank account. In AnchorX, this will be use when the user wants to withdraw money from AnchorX.

When crediting account you saw that `USD` was being minted. For debiting, you'll be doing the opposite process, taking `USD` from an user's account and sending it back to the issuing account. In Stellar, when an asset is sent back to the issuing account, it gets destroyed.

The code on the right shows the debit mutation. It is very similar to the credit operation, but the difference is that the destination is the issuing account. [Pull request #13](https://github.com/abuiles/anchorx-api/pull/13) shows the changes in the mutation and schema.

The following GIF shows you the debit mutation and how assets get destroyed after sending them back.

![](https://d3vv6lp55qjaqc.cloudfront.net/items/2f382x1B1T123J3T1c3d/Screen%20Recording%202018-07-10%20at%2011.28%20AM.gif?X-CloudApp-Visitor-Id=49274&v=4a3a8dc0)

## Conclusion

Congratulations! You have now a very basic implementation of AnchorX API. In this chapter you learnt:

  - [How to create Stellar accounts programatically.](#creating-the-account-in-the-stellar-ledger)
  - [How to issue new assets in Stellar.](#issuing-anchorx-custom-asset)
  - [How to create trustlines in Stellar and authorize truslines.](#creating-a-trustline)
  - [Signing transactions and making payments with Stellar.](#payments)
  - [What happens after an issuing account issues more assets.](#credit-account)
  - [What happens after an issuing account receives back issued assets.](#debit-account)

In the next chapter you'll be building a mobile wallet in React Native to allow AnchorX customer to interact with their accounts. You'll also learn how to use the Stellar JS SDK to read accounts data and follow payments. After you build the wallet, you will learn about best practices like managing secret keys, using a base account along with the issuing account, how to setup multisignatutre schemas and security considerations.

# Building the mobile wallet

In this chapter you'll learn how to use the Stellar JS SDK in React
Native and use it to display balances and transactions. This tutorial
won't go into details on things which are not related with Stellar
like setting up React Native, navigation, setting Apollo, etc. This
tutorial includes a boilerplate project which has all the basics already setup.

When interacting with Stellar, you will find a detailed section explaining what's happening.

The wallet will be written using the following technologies:

- [React Native](https://facebook.github.io/react-native/).
- [TypeScript](https://www.typescriptlang.org/).
- [GraphQL with Apollo](https://www.apollographql.com/).
- [Storybook](https://github.com/storybooks/storybook/tree/master/app/react-native).
- [NativeBase](https://nativebase.io/).
- [React-Navigation](https://github.com/react-navigation/react-navigation).

## Mobile wallet boilerplate

The following GIF shows you all the screens and functionality included in the mobile wallet boilerplate.

![](https://d3vv6lp55qjaqc.cloudfront.net/items/1a132y2a340n1Y272Z1S/Screen%20Recording%202018-07-17%20at%2011.06%20AM.gif?X-CloudApp-Visitor-Id=49274&v=78531abe)

As you can see the login/signup screen is already configured to consume the `GraphQL` API. After the user signs in you will display the balance and transaction history and give the user the option to make new payments.

Before downloading the boilerplate, install the required dependencies to run React Native applications. You can find the list of requirements in the following page [https://facebook.github.io/react-native/docs/getting-started](https://facebook.github.io/react-native/docs/getting-started), click in `Build Projects with Native Code` and follow the instructions.

Next, download the boilerplate with the following commands:

1. `git clone https://github.com/abuiles/StellarMobileWalletBoilerplate AnchorX`
2. `cd AnchorX`
3. `yarn install`

After the dependencies are installed, you should be able to run the Android or iOS version with the following commands:

- iOS: `yarn run ios`
- Android: `yarn run android`

Once the application is running start a session by putting your favorite username. You will see a placeholder balance showing `$1000`, your `username` and `stellarAccount`. In the following session you will install the JS Stellar SDK and use it to show the account's real balance.

## Using the Stellar-SDK in React Native
Using the JS Stellar SDK requires extra setup because the package depends in some Node core modules like `crypto` or globals like `process`, which are not available in React Native.

If you try to run the application and import the SDK, you will see an error like the following:

![](https://d3vv6lp55qjaqc.cloudfront.net/items/1b13041l020I0s2l0L3o/%5B38cfda07cc131d3a1e9d71bf82fb8887%5D_Image+2018-07-18+at+1.29.16+PM.png?X-CloudApp-Visitor-Id=49274&v=f0422f8c)

This is a known issue in the React Native world and there is a solution for it. To solve the problem you need to install the package [node-libs-react-native
](https://github.com/parshap/node-libs-react-native) which provides the implementation for some of those modules and [vm-browserify](https://github.com/browserify/vm-browserify).

Run the following commands:

- `yarn add node-libs-react-native vm-browserify react-native-randombytes`
- `react-native link`

```javascript
// rn-cli.config.js
const extraNodeModules = require('node-libs-react-native')
extraNodeModules.vm = require.resolve('vm-browserify')

module.exports = {
  getTransformModulePath() {
    return require.resolve("react-native-typescript-transformer");
  },
  getSourceExts() {
    return ["ts", "tsx"];
  },
  extraNodeModules
};
```

Edit the file `rn-cli.config.js` file in the root directory to look like the code in the right and then add to `index.js` in the root container the following at the top: `import 'node-libs-react-native/globals'`

You can see the changes in [pull request #10](https://github.com/abuiles/AnchorX/pull/10/files). The relevant pieces are:

- [package.json](https://github.com/abuiles/AnchorX/pull/10/files#diff-b9cfc7f2cdf78a7f4b91a753d10865a2)
- [rn-cli.config.js](https://github.com/abuiles/AnchorX/pull/10/files#diff-41fdc10e1b5862877e4afa7e9176ee09)
- [index.js](https://github.com/abuiles/AnchorX/pull/10/files#diff-168726dbe96b3ce427e7fedce31bb0bc)

### Installing the SDK and writing your first component

Once you have the depencies to install the SDK, run the following command:

- `yarn add stellar-sdk @types/stellar-sdk`

Next you need to create a new container component which will load the Stellar account from the ledger and then display the balance for AnchorX custom asset.

The container component will have the following props:

- `stellarAccount`: Stellar account id to load.
- `asset`: since Stellar accounts can hold multiple assets, you'll tell explicitly to the component which asset to display.

```javascript
import * as React from 'react'
import {
  Platform,
  StyleSheet,
  View
} from 'react-native'

import {
  Asset,
  AccountResponse,
  Network,
  Server
} from 'stellar-sdk'

import { Text } from 'native-base'
import { styles as s } from 'react-native-style-tachyons'

import Loading from '../components/Loading'

interface Props {
  accountId: string
  asset: Asset
}

interface State {
  sdkAccount: AccountResponse
}

export default class Balance extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props)
    this.state = {}
  }

  async componentDidMount() {
    const { accountId } = this.props
    const stellarServer = new Server('https://horizon-testnet.stellar.org')
    // load the account from Horizon
    const sdkAccount = await stellarServer.loadAccount(accountId)

    this.setState({
      sdkAccount
    })
  }

  render() {
    const { sdkAccount } = this.state
    const { asset } = this.props

    if (!sdkAccount) return <Loading />

    const { balance } = sdkAccount.balances.find(({ asset_code, asset_issuer }) => asset_code === asset.code && asset_issuer === asset.issuer)

    return (
      <View style={[s.jcc, s.aic]}>
        <Text style={s.f3}>
          {balance}
        </Text>
      </View>
    )
  }
}
```

Create the component by running `touch app/containers/Balance.tsx` and then paste the content on the right.

> Update `app/containers/Home.tsx` to render the Balance component.

```javascript
 import { NavigationScreenProps } from 'react-navigation'
+import { Asset } from 'stellar-sdk'
+
+import Balance from './Balance'

 export default class Home extends React.Component<NavigationScreenProps> {
   static navigationOptions = {
@@ -18,6 +21,11 @@ export default class Home extends React.Component<NavigationScreenProps> {
   }

   render() {
+    const anchorXUSD = new Asset(
+      'USD',
+      'GBX67BEOABQAELIP2XTC6JXHJPASKYCIQNS7WF6GWPSCBEAJEK74HK36'
+    )
+
     return (
       <CurrentUserQuery query={GET_CURRENT_USER_QUERY}>
         {({ loading, data }) => {
@@ -58,7 +66,9 @@ export default class Home extends React.Component<NavigationScreenProps> {
                      s.pa4
                    ]}
                  >
-                   <Text>$1000</Text>
+                   <Balance
+                     accountId={data.me.stellarAccount}
+                     asset={anchorXUSD} />
                  </View>
                  <View>
```

After that, you will find the changes in the `Home` container to use `Balance`.

If you run the app, you should see the balance in your AnchorX account.

You can see the changes in this section in [pull request #11](https://github.com/abuiles/AnchorX/pull/11).

![](https://d3vv6lp55qjaqc.cloudfront.net/items/0D3Z3n1C2H2V3D321u2H/Screen%20Recording%202018-07-18%20at%2009.28%20PM.gif?X-CloudApp-Visitor-Id=49274&v=780917c0)

## Balance updates

You can see your balance noew but if you send or receive USD, the balance won't update. The horizon server allows you to call some end-points in streaming mode using Server-Sent Events, account details is one of those end-points.

In this chapter you will learn how to use the streaming mode to update the account balance.

In the following GIF you can see how we need to refresh the app to see the balance updated.

![](https://d3vv6lp55qjaqc.cloudfront.net/items/0L3N0S2D223l3K1S3a2r/Screen%20Recording%202018-07-19%20at%2009.44%20AM.gif?X-CloudApp-Visitor-Id=49274&v=e537cac7)

```js
mutation {
  credit(amount: "10", username:"your-username") {
    id
  }
}
```

You can try it by going to [https://anchorx-api.herokuapp.com/](https://anchorx-api.herokuapp.com/) and writing the mutation on the right using your username.

## Using streaming mode

> Edit `app/containers/Balance.tsx`

```javascript
   async componentDidMount() {
     const { accountId } = this.props
     const stellarServer = new Server('https://horizon-testnet.stellar.org')
     const sdkAccount = await stellarServer.loadAccount(accountId)

+    // Setup streaming to the accountId, this returns a function which
+    // you can use to close the stream.
+    let accountEventsClose = stellarServer.accounts().accountId(accountId).stream({
+      // onmessage is called each time the ledger closes
+      onmessage: res => {
+        const { sdkAccount } = this.state
+
+        // Check if balances changed and if they did update sdkAcount.balances
+        if (sdkAccount.balances !== res.balances) {
+          sdkAccount.balances = res.balances
+
+          this.setState({
+            sdkAccount: sdkAccount
+          })
+        }
+      }
+    });
+
+    // For convinience add this to the account so you can close
+    // on componentWillUnmount. hat-tip to StellarTerm ;)
+    sdkAccount.close = () => {
+      try {
+        accountEventsClose();
+      } catch(e) {
+        console.log('error closing account streaming')
+      }
+    }
+
     this.setState({
       sdkAccount
     })
   }

+  componentWillUnmount() {
+    const { sdkAccount } = this.state
+    // Close the stream when unmounting the component
+    sdkAccount.close()
+  }
+
   render() {
     const { sdkAccount } = this.state
     const { asset } = this.props
}
```

The SDK uses the builder pattern to help you interact with horizon and its different functionalities. Once you have an instance of the server, you can setup streaming by calling the following command: `stellarServer.accounts().accountId(accountId).stream({args})`.

You need to update the lifecycle methods `componentDidMount` and `componentWillUnmount` in  `app/containers/Balance.tsx`. On the right you will find the additions with comments.

<aside class="notice">
You can find the documentation for the account builder <a href="https://stellar.github.io/js-stellar-sdk/AccountCallBuilder.html">here</a>
</aside>


In the GIF below you can see how the balance updates now after using streaming.

![](https://d3vv6lp55qjaqc.cloudfront.net/items/2w3D461n0K3I1M0F2H2J/Screen%20Recording%202018-07-19%20at%2010.59%20AM.gif?X-CloudApp-Visitor-Id=49274&v=cfe8eea8)

You can find the changes in this section in [pull request #12](https://github.com/abuiles/AnchorX/pull/12).

Next, let's create  display the account payments.

## Payment component

First you need to add a component to display a single payment. If the payment if a debit it will show the message "You paid X" and the value. If you are the receipient, then it shows "X paid you".

![](https://d3vv6lp55qjaqc.cloudfront.net/items/3K3a1P2l0v1r2X3o2X3A/Screen%20Recording%202018-07-19%20at%2004.55%20PM.gif?X-CloudApp-Visitor-Id=49274&v=b9dca21b)

The only thing concerning Stellar here is how you can use the TypeScript type to specify that the component will receive a `PaymentOperationRecord` as part of the props.

```javascript
import { PaymentOperationRecord } from 'stellar-sdk'

interface Props {
  account: string
  payment: PaymentOperationRecord
}
```

You can find the component implementation in [pull request #13](https://github.com/abuiles/AnchorX/pull/13).

Next you'll write a container to load the payments and use the Payment component for each entry.

## Showing payments

> Create the file `app/containers/Payments.tsx` with the following code:

```javascript
import * as React from 'react'
import { View, StyleSheet, FlatList } from 'react-native'

import { Container, Content, Text, Button, Spinner } from 'native-base'
import { styles as s } from 'react-native-style-tachyons'

import { Asset, PaymentOperationRecord, Server, Network } from 'stellar-sdk'

import Payment from '../components/Payment'

interface Props {
  accountId: string
  asset?: Asset
}

interface State {
  loadMore: boolean
  payments: PaymentOperationRecord[]
  loading: boolean
  closeStreaming?: any
}


export default class Payments extends React.Component<Props, State> {
  constructor(props: Props) {
    super(props)

    this.state = {
      loadMore: true,
      payments: [],
      loading: false
    }
  }

  async loadPayments(cursor?: string) {
    const { accountId, asset } = this.props
    const { payments } = this.state
    Network.useTestNetwork()
    const stellarServer = new Server('https://horizon-testnet.stellar.org')

    // Load payments for account in descending order, most recentfirst.
    let builder = stellarServer
      .payments()
      .forAccount(accountId)
      .order('desc')

    if (cursor) {
      builder.cursor(cursor)
    }

    const { records } = await builder.call()

    if (asset) {
      return records.filter((payment) => payment.asset_code === asset.code && payment.asset_issuer === asset.issuer)
    } else {
      return records
    }
  }

  /* Use `now` in the cursor to be notified of new payments. If you don't
   * set the cursor to "now", then you'll be notified about all the
   * payments since account's creation.*/
  listenForPayments(cursor = 'now') {
    const { closeStreaming } = this.state

    if (closeStreaming) {
      try {
        closeStreaming()
      } catch (e) {
        console.log('error closing streaming')
      }
    }

    const { accountId } = this.props

    Network.useTestNetwork()
    const server = new Server('https://horizon-testnet.stellar.org')

    // Notice how we are using PaymentOperationRecord from @types/stellar-sdk
    let handleMessage = (payment: PaymentOperationRecord) => {
      const { asset } = this.props
      const { payments } = this.state

      if (payment.asset_code === asset.code && payment.asset_issuer === asset.issuer) {
        this.setState({
          payments: [payment, ...payments]
        })
      }
    }

    this.setState({
      closeStreaming: server.payments()
        .cursor(cursor)
        .forAccount(accountId)
        .stream({
          onmessage: handleMessage
        })
    })
  }

  /* After the component mounts, load the first page of payments and
   * setup streaming*/
  async componentDidMount() {
    const payments = await this.loadPayments()

    this.setState({
      payments
    })

    this.listenForPayments()
  }

  componentWillUnmount() {
    const { closeStreaming } = this.state

    try {
      closeStreaming && closeStreaming()
    } catch (e) {
      console.log('error closing streaming')
    }
  }

  /* Method use for pagination, it gets calls when the end of the list is
   * reached.  It calls the generic function loadPayments using the last
   * item in payments as the cursor.
   */
  async fetchMoreData() {
    const { accountId } = this.props
    const { payments } = this.state

    const cursor = payments[payments.length - 1].id

    this.setState({
      loading: true
    })

    const nextPage = await this.loadPayments(cursor)

    const state = {
      loadMore: true,
      payments: [...payments, ...nextPage],
      loading: false
    }

    if (nextPage.length === 0) {
      state.loadMore = false
    }

    this.setState(state)
  }

  render() {
    const { accountId } = this.props
    const { loadMore, payments, loading } = this.state

    return (
      <Container style={{ backgroundColor: '#F5FCFF' }} >
        <FlatList
          data={payments}
          renderItem={({ item }) => <Payment key={item.id} payment={item} account={accountId} />}
          keyExtractor={(item) => item.id}
          onEndReachedThreshold={0.2}
          onEndReached={({ distanceFromEnd }) => {
            if (!loadMore || loading) {
              return
            }

            return this.fetchMoreData()
          }}
          refreshing={loading}
          ListFooterComponent={loading && <Spinner color="blue" />}
          onRefresh={() => {
            if (payments.length > 0) {
              this.listenForPayments(payments[0].id)
            }
          }}
        />
      </Container>
    )
  }
}
```

To show transactions, you will follow a similar pattern to the one use in the previous section. Create a container component which will load the last page of payments using the [payments method](https://stellar.github.io/js-stellar-sdk/Server.html#payments) in the Server class. And then use streaming from the [PaymentCallBuilder](https://stellar.github.io/js-stellar-sdk/PaymentCallBuilder.html).

At this point most of the changes are related with React and building components. On the right you can see the component implementation. The following functions use the SDK:

- `loadPayments`: Sets the server and loads the first page of payments.
- `listenForPayments`: Set streaming.
- `fetchMoreData`: Call when loading more payments.

Also, noticed how you can use types defined in `@types/stellar-sdk` like `PaymentOperationRecord`.

After creating the component, you can import it in the Home container and use it by passing the `accountId` and `asset`, you can see the change [here](https://github.com/abuiles/AnchorX/pull/14/files#diff-32a848d19077743a2d26b348315714e3R75).

![](https://d3vv6lp55qjaqc.cloudfront.net/items/2N1v02411B0H2y43362n/Screen%20Recording%202018-07-20%20at%2011.06%20AM.gif?X-CloudApp-Visitor-Id=49274&v=de150e07)

You can see the the changes in [pull request #14](https://github.com/abuiles/AnchorX/pull/14/files)

## Depositing "fiat" into your wallet
A fake implementation in the wallet similar to transferring money from a bank.

## Sending payments
Flow for doing P2P payments.
## Cashing out
Fake implementation for transferring money to the bank accountp

# Best practices
Best practices for managing issuing accounts, signing transactions on behalf of users, etc.
# Security
Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.

## Infrastructure
## Keeping keys secure
