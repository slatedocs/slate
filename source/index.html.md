---
title: API Reference

language_tabs: # must be one of https://git.io/vQNgJ
  - shell
  - ruby
  - python
  - javascript

toc_footers:
  - <a href='https://twitter.com/abuiles'>Follow me on on Twitter @abuiles</a>
  - <a href='https://github.com/lord/slate'>Documentation Powered by Slate</a>

includes:
  - errors

search: true
---

# Building your own Venmo with Stellar

Welcome to building your own Venmo with Stellar. This guide will show you how to create a product "similar" to Venmo using Stellar.

> ![](https://d3vv6lp55qjaqc.cloudfront.net/items/2B1011461n3o0x1n0143/Image%202018-06-12%20at%209.19.12%20PM.png?X-CloudApp-Visitor-Id=49274&v=204e84f5)

In the Stellar universe, an entity like Venmo is called an Anchor.

<aside class="notice">
Anchors are entities that people trust to hold their deposits and issue credits into the Stellar network for those deposits.
</aside>

The [official documentation](https://www.stellar.org/developers/guides/anchor/index.html#customer-accounts) to create an anchor suggests two ways to maintain customers
accounts:

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

# Concepts

Before getting started I'd like to introduce some important concepts
in Stellar. Some of them are really well explained in the Stellar
docs, so I'll just quote them here and link to the original source.

## Assets


```json
{
  "id": "GAPNZVXA7ZHZ3NECIFSX5WTW6CRHZ2GEK3ISIYBHBW24POHBEUIZCJOO",
  "paging_token": "",
  "account_id": "GAPNZVXA7ZHZ3NECIFSX5WTW6CRHZ2GEK3ISIYBHBW24POHBEUIZCJOO",
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
      "balance": "158.7012235",
      "asset_type": "native"
    }
  ]
}
```
The Stellar network allows us to represent any kind of asset. All assets
in Stellar can be traded and exchanged with each other.

Like other protocols, Stellar has a native asset which is called the
`Lumen` represented with the symbol `XLM`. Accounts can hold
multiple assets as long as they trust the asset and in some
cases they have been authorized to hold the asset.

Any account can create their own asset representing traditional or custom assets.

Traditional assets are a cryptographic representation of things like
fiat, equity, real estate, goats, you name it.

Lumens are an example of a custom asset or token, at they allow us to
interact with the Stellar network. There are many other types of
assets built on top of Stellar, one example is the EURT which is a
representation of the EURO and allow people to do cross-border
remittances without incurring in high transaction fees. There is also
MOBI which allow people to use the Mobius network, if you hold MOBI then
your can interact with the applications in the network.

On there right you can see the JSON representation of a Stellar
account. Each account has a key called balances, representing the
assets held by the account.

The account on the right has the following assets:

- MOBI: Asset issued by Mobius network
- EURT: Asset issued by Tempo a remittances company
- ETH: This asset represents Ether, issued by http://papaya.io/
- USD: Asset representing Dollar, issued by Stronghold
- native: Native asset of the network, represents Lumens

Assets in Stellar are representet by a combination of `code` and `issuer`. It is possible then to find two assets with the code `USD` representing Dollars but one can be issued by Bank Of America and the other by Venmo.

You can learn more about visiting the Stellar docs [https://www.stellar.org/developers/guides/concepts/assets.html](https://www.stellar.org/developers/guides/concepts/assets.html)

## Account

## Anchor
## Assets
> To authorize, use this code:

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
```

```shell
# With shell, you can just pass the correct header with each request
curl "api_endpoint_here"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
```

> Make sure to replace `meowmeowmeow` with your API key.

Kittn uses API keys to allow access to the API. You can register a new Kittn API key at our [developer portal](http://example.com/developers).

Kittn expects for the API key to be included in all API requests to the server in a header that looks like the following:

`Authorization: meowmeowmeow`

<aside class="notice">
You must replace <code>meowmeowmeow</code> with your personal API key.
</aside>

## Multisignature

# Anchor Setup

Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.


## Creating an user account

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get()
```

```shell
curl "http://example.com/api/kittens"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let kittens = api.kittens.get();
```

> The above command returns JSON structured like this:

```json
[
  {
    "id": 1,
    "name": "Fluffums",
    "breed": "calico",
    "fluffiness": 6,
    "cuteness": 7
  },
  {
    "id": 2,
    "name": "Max",
    "breed": "unknown",
    "fluffiness": 5,
    "cuteness": 10
  }
]
```

This endpoint retrieves all kittens.

### HTTP Request

`GET http://example.com/api/kittens`

### Query Parameters

Parameter | Default | Description
--------- | ------- | -----------
include_cats | false | If set to true, the result will also include cats.
available | true | If set to false, the result will include kittens that have already been adopted.

<aside class="success">
Remember — a happy kitten is an authenticated kitten!
</aside>

## Adding a trustline

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.get(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.get(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.get(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "name": "Max",
  "breed": "unknown",
  "fluffiness": 5,
  "cuteness": 10
}
```

This endpoint retrieves a specific kitten.

<aside class="warning">Inside HTML code blocks like this one, you can't use Markdown, so use <code>&lt;code&gt;</code> blocks to denote code.</aside>

### HTTP Request

`GET http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to retrieve

## Setting up multisignature

```ruby
require 'kittn'

api = Kittn::APIClient.authorize!('meowmeowmeow')
api.kittens.delete(2)
```

```python
import kittn

api = kittn.authorize('meowmeowmeow')
api.kittens.delete(2)
```

```shell
curl "http://example.com/api/kittens/2"
  -X DELETE
  -H "Authorization: meowmeowmeow"
```

```javascript
const kittn = require('kittn');

let api = kittn.authorize('meowmeowmeow');
let max = api.kittens.delete(2);
```

> The above command returns JSON structured like this:

```json
{
  "id": 2,
  "deleted" : ":("
}
```

This endpoint deletes a specific kitten.

### HTTP Request

`DELETE http://example.com/kittens/<ID>`

### URL Parameters

Parameter | Description
--------- | -----------
ID | The ID of the kitten to delete

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
